Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB5DC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 20:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfVYpNxf4XnnGChuCvauoyWYtfhIrTtO0AElDeej1QI=; b=LHO8b1/FkqemJF
	rniM2phk8QM0imFj4AQ3XrSsZuVQ2Sg5YIhsRn5sHQvM5CEZFU86ChRjVaHecUI2/ibmLMrbqmjMa
	QIo/SUTCZ6o4F1NREToFF8s/vKg3KsLu9iD5SJsTfnN1AtLDXUx+AmqWDTtYl8hJzg3w03fyFAOm9
	Osi+tTJqIakY7G9hMV+EmonK/+Xs48Y0hynfEFNCgdVVRKNczZRhuxtWlSz1pzphRad5ibTFp+VZQ
	if6wjVCLq0HVT5gYTkXHwYpZXR3XP34o3/32zFo3orr9X7miXZsJEdyiBxhL0qsP1aD6phFe5rWQO
	x2VNAuHFbNZXd4JvOmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRH5L-00000008TUm-1Fun;
	Tue, 09 Jul 2024 20:05:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRH5H-00000008TTk-3aep
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 20:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720555506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acV3bdXIqAgQ8trrw2JLt1DVrqR2fOsC/08QRSeWEs4=;
	b=X58P9/O81hwd8xjm9OHkG9mhc53vubhV7oUcjxOQFXS5IH1v5S9gBkPNocCO8HORwaFav1
	DISKMQ3AndJNFBOCTsnwN701d3Om3GbI6Gyw0+s73giB0nOAwE7gyu30ILmKVa8xmiUx4R
	jjN1qR/pgwTmSgjW5s+adfO48gSCQp8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-IX5HUi3LNUOI-rRZMfUr-Q-1; Tue, 09 Jul 2024 16:05:05 -0400
X-MC-Unique: IX5HUi3LNUOI-rRZMfUr-Q-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-447dfa83881so5378031cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 13:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720555505; x=1721160305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acV3bdXIqAgQ8trrw2JLt1DVrqR2fOsC/08QRSeWEs4=;
        b=rMvfftdSJfbWLHzhhYs6p2IB4U+yGk1rrLrERtDbRGLy2sdwGzFTtWblxWS/5wQr/0
         bTufpG5wKVkMOywQO0MmQ4uDnxmjwmlnS/McH7KLwMHg3y2iCb1tXMRE87elIwwNUyoq
         5exWoBtwObRzouABuwTNDPMv6wDJvm6fUdX1RuDPVBn2ejjx17uZi8lFjjm0i5PL5j5p
         320QJow8hUpyUdlsIZIepQd1GsdCx8c1ovBVBGGakfsUk2/ZeSfw0BUTZ61kux8z2IME
         SnGh4k6D5mp+tXJ2HlLbGwswDUAwqC5ZB1i3193sjLbLILRM9ImUHR5Ctwqk3Qb6QDhQ
         H36g==
X-Forwarded-Encrypted: i=1; AJvYcCX+OGfIT7ykcn9Gg6w3/yVOWf5hIMd5JMF5Gu8em/Xh3rwgemWoUizpztiQEJjemhv/25JU0ynVm7213E9KI/q1RJCp3cxrji84iA8GNUKd
X-Gm-Message-State: AOJu0YwdOnnh2FkO445b9Mb9FkfwvG7zx4UqDxKzlq0wkgvJmQkJdi0T
	jnt1UhNB+5PEPVkTWq582/x/+Coo6d++8NUHAuBlwkYaNlZBTD7kpXi5Tt5Ia3IKKqCn6zU0Jz7
	6J0OxOWZuURsyovSCkfzl4nYsFwv37m+Z6CheL1fv/gdoH10gE+tTFGnujpML1+vMOQ==
X-Received: by 2002:a05:620a:171f:b0:79f:4e6:180c with SMTP id af79cd13be357-79f199d7312mr455691185a.1.1720555504906;
        Tue, 09 Jul 2024 13:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGod5HLhjaEtr8mfDORMGJvPtwJ15+Y7CImilQWW2qICV4jpZZUSz7pT07l60mMJH24idc6CQ==
X-Received: by 2002:a05:620a:171f:b0:79f:4e6:180c with SMTP id af79cd13be357-79f199d7312mr455688385a.1.1720555504525;
        Tue, 09 Jul 2024 13:05:04 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff691bsm129139385a.21.2024.07.09.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 13:05:03 -0700 (PDT)
Date: Tue, 9 Jul 2024 16:05:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Message-ID: <Zo2X7aOxBb7U5J2s@x1n>
References: <b601e1a88e3a5d4d93b130fa20184b555e2a2bea.1720074307.git.christophe.leroy@csgroup.eu>
 <c8cb83b709740f7ac835997b88c5ddda610f66ab.1720074307.git.christophe.leroy@csgroup.eu>
 <Zoa2Qnpzl97hmpHC@x1n>
 <56a0340a-2534-4d2e-92e4-cf27a6358b23@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <56a0340a-2534-4d2e-92e4-cf27a6358b23@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_130507_995604_CCB53D97 
X-CRM114-Status: GOOD (  32.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMDksIDIwMjQgYXQgMDk6NDg6MjRQTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAKPiAKPiBMZSAwNC8wNy8yMDI0IMOgIDE2OjQ4LCBQZXRlciBYdSBhIMOpY3Jp
dMKgOgo+ID4gT24gVGh1LCBKdWwgMDQsIDIwMjQgYXQgMDg6MzA6MDVBTSArMDIwMCwgQ2hyaXN0
b3BoZSBMZXJveSB3cm90ZToKPiA+ID4gQ29tbWl0IDJjOGE4MWRjMGNjNSAoInJpc2N2L21tOiBm
aXggdHdvIHBhZ2UgdGFibGUgY2hlY2sgcmVsYXRlZAo+ID4gPiBpc3N1ZXMiKSBhZGRlZCBwdWRf
bGVhZigpIGluIGluY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oCj4gPiA+IAo+ID4g
PiBEbyB0aGUgc2FtZSBmb3IgcDRkX2xlYWYoKSBhbmQgcGdkX2xlYWYoKSB0byBhdm9pZCBnZXR0
aW5nIHRoZW0KPiA+ID4gZXJyb25lb3VzbHkgZGVmaW5lZCBieSBhcmNoaXRlY3R1cmVzIHRoYXQg
ZG8gbm90IGltcGxlbWVudCB0aGUKPiA+ID4gcmVsYXRlZCBwYWdlIGxldmVsLgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Pgo+ID4gPiAtLS0KPiA+ID4gICBpbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9w
NGQuaCB8IDEgKwo+ID4gPiAgIGluY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3B1ZC5oIHwg
MSArCj4gPiA+ICAgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggICAgICAgICAgICAgfCA2ICsrKy0t
LQo+ID4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1u
b3A0ZC5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcDRkLmgKPiA+ID4gaW5kZXgg
MDNiN2RhZTQ3ZGQ0Li43NWM5NmJiYzVhOTYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvYXNt
LWdlbmVyaWMvcGd0YWJsZS1ub3A0ZC5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMv
cGd0YWJsZS1ub3A0ZC5oCj4gPiA+IEBAIC0yMSw2ICsyMSw3IEBAIHR5cGVkZWYgc3RydWN0IHsg
cGdkX3QgcGdkOyB9IHA0ZF90Owo+ID4gPiAgIHN0YXRpYyBpbmxpbmUgaW50IHBnZF9ub25lKHBn
ZF90IHBnZCkJCXsgcmV0dXJuIDA7IH0KPiA+ID4gICBzdGF0aWMgaW5saW5lIGludCBwZ2RfYmFk
KHBnZF90IHBnZCkJCXsgcmV0dXJuIDA7IH0KPiA+ID4gICBzdGF0aWMgaW5saW5lIGludCBwZ2Rf
cHJlc2VudChwZ2RfdCBwZ2QpCXsgcmV0dXJuIDE7IH0KPiA+ID4gK3N0YXRpYyBpbmxpbmUgaW50
IHBnZF9sZWFmKHBnZF90IHBnZCkJCXsgcmV0dXJuIDA7IH0KPiA+ID4gICBzdGF0aWMgaW5saW5l
IHZvaWQgcGdkX2NsZWFyKHBnZF90ICpwZ2QpCXsgfQo+ID4gPiAgICNkZWZpbmUgcDRkX0VSUk9S
KHA0ZCkJCQkJKHBnZF9FUlJPUigocDRkKS5wZ2QpKQo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcHVkLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3BndGFi
bGUtbm9wdWQuaAo+ID4gPiBpbmRleCBlYjcwYzZkN2NlZmYuLjE0YWViOGVmMmQ4YSAxMDA2NDQK
PiA+ID4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcHVkLmgKPiA+ID4gKysr
IGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcHVkLmgKPiA+ID4gQEAgLTI4LDYgKzI4
LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgeyBwNGRfdCBwNGQ7IH0gcHVkX3Q7Cj4gPiA+ICAgc3RhdGlj
IGlubGluZSBpbnQgcDRkX25vbmUocDRkX3QgcDRkKQkJeyByZXR1cm4gMDsgfQo+ID4gPiAgIHN0
YXRpYyBpbmxpbmUgaW50IHA0ZF9iYWQocDRkX3QgcDRkKQkJeyByZXR1cm4gMDsgfQo+ID4gPiAg
IHN0YXRpYyBpbmxpbmUgaW50IHA0ZF9wcmVzZW50KHA0ZF90IHA0ZCkJeyByZXR1cm4gMTsgfQo+
ID4gPiArc3RhdGljIGlubGluZSBpbnQgcDRkX2xlYWYocDRkX3QgcDRkKQkJeyByZXR1cm4gMDsg
fQo+ID4gPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwNGRfY2xlYXIocDRkX3QgKnA0ZCkJeyB9Cj4g
PiA+ICAgI2RlZmluZSBwdWRfRVJST1IocHVkKQkJCQkocDRkX0VSUk9SKChwdWQpLnA0ZCkpCj4g
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaCBiL2luY2x1ZGUvbGludXgv
cGd0YWJsZS5oCj4gPiA+IGluZGV4IDJhNmEzY2NjZmMzNi4uYjI3ZTY2ZjU0MmQ2IDEwMDY0NAo+
ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+ID4gPiArKysgYi9pbmNsdWRlL2xp
bnV4L3BndGFibGUuaAo+ID4gPiBAQCAtMTg4MiwxMyArMTg4MiwxMyBAQCB0eXBlZGVmIHVuc2ln
bmVkIGludCBwZ3RibF9tb2RfbWFzazsKPiA+ID4gICAgKiAtIEl0IHNob3VsZCBjb3ZlciBhbGwg
a2luZHMgb2YgaHVnZSBtYXBwaW5ncyAoZS5nLiwgcFhkX3RyYW5zX2h1Z2UoKSwKPiA+ID4gICAg
KiAgIHBYZF9kZXZtYXAoKSwgb3IgaHVnZXRsYiBtYXBwaW5ncykuCj4gPiA+ICAgICovCj4gPiA+
IC0jaWZuZGVmIHBnZF9sZWFmCj4gPiA+ICsjaWYgIWRlZmluZWQoX19QQUdFVEFCTEVfUDREX0ZP
TERFRCkgJiYgIWRlZmluZWQocGdkX2xlYWYpCj4gPiA+ICAgI2RlZmluZSBwZ2RfbGVhZih4KQlm
YWxzZQo+ID4gPiAgICNlbmRpZgo+ID4gPiAtI2lmbmRlZiBwNGRfbGVhZgo+ID4gPiArI2lmICFk
ZWZpbmVkKF9fUEFHRVRBQkxFX1BVRF9GT0xERUQpICYmICFkZWZpbmVkKHA0ZF9sZWFmKQo+ID4g
PiAgICNkZWZpbmUgcDRkX2xlYWYoeCkJZmFsc2UKPiA+ID4gICAjZW5kaWYKPiA+ID4gLSNpZm5k
ZWYgcHVkX2xlYWYKPiA+ID4gKyNpZiAhZGVmaW5lZChfX1BBR0VUQUJMRV9QTURfRk9MREVEKSAm
JiAhZGVmaW5lZChwdWRfbGVhZikKPiA+ID4gICAjZGVmaW5lIHB1ZF9sZWFmKHgpCWZhbHNlCj4g
PiA+ICAgI2VuZGlmCj4gPiA+ICAgI2lmbmRlZiBwbWRfbGVhZgo+ID4gCj4gPiBJcyBpdCBwb3Nz
aWJsZSB0byBkbyBpdCB0aGUgb3RoZXIgd2F5IHJvdW5kLCBzbyB0aGF0IHdlIGNhbiBzdGlsbCBy
ZWx5IG9uCj4gPiAiaWZkZWYgcHh4X2xlYWYiIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHByb3ZpZGUg
YSBmYWxsYmFjaywgYW5kIGRlZmluZSB0aGVtCj4gPiBwcm9wZXJseSB3aGVuIG5lZWRlZD8KPiAK
PiBXaGF0IGRvIHlvdSBtZWFuIGJ5IHRoZSAib3RoZXIgd2F5IHJvdW5kIiA/IERpZCBJIGRvIGEg
bWlzdGFrZSA/IEkgY2FuJ3Qgc2VlCj4gaXQuCj4gCj4gVGhlIHB1cnBvc2UgaGVyZSBpczoKPiAt
IElmIHRoZSBhcmNoaXRlY3R1cmUgaGFzIHRoZSBzYWlkIGxldmVsIGFuZCBpbXBsZW1lbnRzIHBY
ZF9sZWFmKCksIHRoYXQncwo+IGZpbmUKPiAtIElmIHRoZSBhcmNoaXRlY3R1cmUgaGFzIHRoZSBz
YWlkIGxldmVsIGFuZCBkb2Vzbid0IGltcGxlbWVudCBwWGRfbGVhZigpLAo+IHRoYXQncyBhbHNv
IGZpbmUsIGEgZmFsbGJhY2sgaXMgcHJvdmlkZWQuCj4gLSBJZiB0aGUgYXJjaGl0ZWN0dXJlIGRv
ZXNuJ3QgaGF2ZSB0aGUgc2FpZCBsZXZlbCBidXQgaW1wbGVtZW50cyBwWGRfbGVhZigpLAo+IGl0
IHdpbGwgY29uZmxpY3Qgd2l0aCB0aGUgZGVmaW5pdGlvbiBpbiBpbmNsdWRlL2FzbS1nZW5lcmlj
L3BndGFibGUtbm9wWGQuaAo+IGFuZCB0aGUgYnVpbGQgd2lsbCBmYWlsLgo+IAo+IFRoZSBwdXJw
b3NlIGlzIHRvIG1ha2Ugc3VyZSBhcmNoaXRlY3R1cmVzIGRvbid0IGltcGxlbWVudCBwWGRfbGVh
ZigpIGF0IHRoZQo+IHdyb25nIGxldmVsLCBmb3IgaW5zdGFuY2U6Cj4gLSBhbiBhcmNoaXRlY3R1
cmUgd2l0aG91dCBQTURzIHNoYWxsIG5vdCBpbXBsZW1lbnQgYW55dGhpbmcgZWxzZSB0aGFuCj4g
cG1kX2xlYWYoKQo+IC0gYW4gYXJjaGl0ZWN0dXJlIHdpdGhvdXQgUDREcyBzaGFsbCBub3QgaW1w
bGVtZW50IHBnZF9sZWFmKCkuCgpXaGF0IEkgbWVhbnQgaXMgaXQnbGwgYmUgbmljZSB0byBrZWVw
IHRoZSBwYXR0ZXJuIG9mIHVzaW5nOgoKI2lmbmRlZiBYWFgKI2RlZmluZSBYWFggLi4uCiNlbmRp
ZgoKUmF0aGVyIHRoYW46CgojaWYgZGVmaW5lZChZWVkpICYmICFkZWZpbmVkKFhYWCkKI2RlZmlu
ZSBYWFggLi4uCiNlbmRpZgoKVGhlIHJlYXNvbiBpcyBpdCBpcyBub3QgYXMgb2J2aW91cyBhcyBw
cmV2aW91cyBvbmUsIGFuZCB3ZSBjYW4gc3RpbGwgbWlzcwpzb21lIGRlZmluZXMgZGVwZW5kaW5n
IG9uIHdoZXRoZXIgWVlZIHdhcyB0aGVyZS4KClRoZSBjdXJyZW50IHBhdGNoIGFsc28gZGlkbid0
IGZvbGxvdyB0aGUgcnVsZSB3aGVyZSAiaWYgcHh4X2xlYWYgaXMKZGVmaW5lZCwgd2Ugc2hvdWxk
IGRlZmluZSB0aGUgbWFjcm8iIHJ1bGUuICBUaGVuIHdlIGludHJvZHVjZSB5ZXQgYW5vdGhlcgpy
dWxlIGZvciBkZWZpbmluZyB0aGVzZS4KCkluIHNob3J0LCB3aGF0IEkgdGhvdWdodCBhcyAidGhl
IG90aGVyIHdheSByb3VuZCIgaXMgYXMgc2ltcGxlIGFzIHNvbWV0aGluZwpsaWtlOgoKPT09ODw9
PT0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oIGIvaW5j
bHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcG1kLmgKaW5kZXggOGZmZDY0ZTdhMjRjLi5jY2Uz
MWMxZjkxNTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5o
CisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oCkBAIC0zMSw4ICszMSw4
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB1ZF9ub25lKHB1ZF90IHB1ZCkgICAgICAgICB7IHJldHVy
biAwOyB9CiBzdGF0aWMgaW5saW5lIGludCBwdWRfYmFkKHB1ZF90IHB1ZCkgICAgICAgICAgIHsg
cmV0dXJuIDA7IH0KIHN0YXRpYyBpbmxpbmUgaW50IHB1ZF9wcmVzZW50KHB1ZF90IHB1ZCkgICAg
ICAgeyByZXR1cm4gMTsgfQogc3RhdGljIGlubGluZSBpbnQgcHVkX3VzZXIocHVkX3QgcHVkKSAg
ICAgICAgICB7IHJldHVybiAwOyB9Ci1zdGF0aWMgaW5saW5lIGludCBwdWRfbGVhZihwdWRfdCBw
dWQpICAgICAgICAgIHsgcmV0dXJuIDA7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBwdWRfY2xlYXIo
cHVkX3QgKnB1ZCkgICAgICAgeyB9CisjZGVmaW5lIHB1ZF9sZWFmKHB1ZCkgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZhbHNlCiAjZGVmaW5lIHBtZF9FUlJPUihwbWQpICAgICAgICAgICAgICAg
ICAgICAgICAgIChwdWRfRVJST1IoKHBtZCkucHVkKSkKIAogI2RlZmluZSBwdWRfcG9wdWxhdGUo
bW0sIHBtZCwgcHRlKSAgICAgICAgICAgICBkbyB7IH0gd2hpbGUgKDApCj09PTg8PT09CgpXaGVu
IHVzZWQgYXMgYSBtYWNybyB3ZSBkb24ndCBuZWVkIHRvIHRvdWNoIGxpbnV4L3BndGFibGUuaC4g
IFdvdWxkIHRoYXQKbG9vayBuaWNlcj8KClRoYW5rcywKCi0tIApQZXRlciBYdQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
