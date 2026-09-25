Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF52FC9831E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 02:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iANXP5le0jaW8KmvzGjOWcigPctfqL7Ax61tAwx+x0=; b=gntqS4d9qtR0Zu
	LirvUn4s+EUhDOt3EDwMtXNjAP5m7oJJnlQvqJB366UdLeHub54vTlJmH9JCumn72sy07oGxIrtEY
	CCotAWUKZKj8gMDQEq1uDj+fnIStTFNlzUZhdIyHpl69fFitMakgYEI8/Uzyj6mVQ8FB11DRXG1aC
	3ucsiHqMchac6qbjnnGcpSCLjoXlKLZCcpe27edw94EKOMOsaNJS8N+WPNuSB4S7ZjWRhJoVWTOVd
	x19TukiMBYQTp/xyMyKLyRHMV5+swhCa8ymIdu7KkLNvwhAlP72oTPwA5+tRYSkt9mYzQusGfc5ij
	C2oCPGPgxELDYkAz+ZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vyQ-0000000CYiD-0SVU;
	Fri, 25 Sep 2026 02:47:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vyM-0000000CYhh-36NY
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 02:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790304456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8EtPgWWYNY80em52aLaC/rO6GqRYVPI8oPHvOAJ7uk=;
	b=Og0WhiKNGFGlzj4KiujkfsaBdl3jtYT5OJa6y9kkqsPpDMFCEAZuGbR71P+WzdRqMbIpg3
	SjmidBFRFp7u9vvhCBKWcVH6I5BFaF0s0Pddn20kaMQ7UFE1/8ilJ+wDYgwQ0mmKwEoIWc
	euXOejsNjDA3PedQjudWdmGPuUUb1Kc=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-9t17fL51MiGNVMkCpVe86Q-1; Thu, 24 Sep 2026 22:47:34 -0400
X-MC-Unique: 9t17fL51MiGNVMkCpVe86Q-1
X-Mimecast-MFC-AGG-ID: 9t17fL51MiGNVMkCpVe86Q_1790304454
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66e5862a158so487404d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 19:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790304454; x=1790909254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8EtPgWWYNY80em52aLaC/rO6GqRYVPI8oPHvOAJ7uk=;
        b=2GaWOCaG6Ks+9ZdsUHJod9xrNl4l00n1yLdlseBd2jHYUgpNXguTEjA0+Y6yDfYgpP
         trzcd1r+Srq/jEmIvah8HqKJ36ZfkDD+A6SK2VPmTLO4BzToqcJ3288AewnWU4HYvJyK
         zANIsJdt3CdC2bmbSjvujVdihozdE2rWxDYXIMXzlPa89+9gO4iAqLcHby7arYgplGUk
         hmxXqefG6i7RFAku64/AsEN5/hc5s7X2GmN8XBFKj4XTqCn+KM2R8lzKT9ajpeMEvxPZ
         DyojIwShiUtbHGxxfS8PvTuVWzhbh9s+5qkkHIPqz4DGXesnA7kqTeCsKuQ441BrGtk5
         yx8Q==
X-Forwarded-Encrypted: i=1; AKwUvBycdK0WaWuA6Utp2QFTTeQZL1g5Lpj/F6XXGEijNtPL9iQMlDtfYXY6wVa0DZSWqivERC69vdd0hJQa7w==@lists.infradead.org
X-Gm-Message-State: AFuF++kg6CjKlBuBJ9WJCrXb9hZInHKdzFSa1Bs1UNu1emJ11G8i5Mdt
	uD5wl46i8qp2/prott+ayY10ryNv7RsWki82bMM0ef1RxMWsNvyK8E860rwhjNmo+wIZkFKCy4G
	FKMdP3uPSUR7P7mHhUIu9i4AG07ZKxLwJuQD8UszMdSHObqzrYWCNCQyAp3f12LwR4eaMt+jJB+
	xvZASx5z9F5tuxfSunoIiB76Vxlw0JqZFesnwnxABLN9S2
X-Gm-Gg: AYBFou21W97NVnz3vrKQCCnPRcH8lickAwiUZqhH7uaclVI5Aibjx8F9aMVoR4jA8Fq
	exYPXIleqIJbuqNohdGotg1mXuQW0K4hpSkXdYAfdkAmsgLxC4f71mTBCcqdbYsKdHxlYCtZod2
	qHTfYg2BbODSPepnasF6ZvszTh5qKAm+hcAbczlpfBnQYVbdA6zm4l4CBgusqIZgYRi1GLvg==
X-Received: by 2002:a05:690e:400b:b0:66f:c1be:a650 with SMTP id 956f58d0204a3-672ed484568mr2732712d50.66.1790304454181;
        Thu, 24 Sep 2026 19:47:34 -0700 (PDT)
X-Received: by 2002:a05:690e:400b:b0:66f:c1be:a650 with SMTP id
 956f58d0204a3-672ed484568mr2732707d50.66.1790304453685; Thu, 24 Sep 2026
 19:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn> <arSr8E0CYQRi8wMs@aurel32.net>
In-Reply-To: <arSr8E0CYQRi8wMs@aurel32.net>
From: Jason Montleon <jmontleo@redhat.com>
Date: Thu, 24 Sep 2026 22:47:22 -0400
X-Gm-Features: AclHuK_n-7A1LEiaPaMaU-m1zfMfdrRJtsrU1av0U8CI_yqyYkPrXTJhyjfUgBE
Message-ID: <CAJD_bPJdR1QOD-O5P1-eDjm8xDFqN=rzVya8T0T3S3TGNoW4Fg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2=5D_riscv=3A_fix_strnlen=28=29_overflow_in_Zbb?=
	=?UTF-8?Q?=C2=A0implementation?=
To: aurelien@aurel32.net
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	gao.rui@zte.com.cn, jiangfeng@kylinos.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HWl7nsMNDYb84NXkoQ25iCP-ZvWI83sfHyhCTdLKGAo_1790304454
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_194738_858836_9C23E5A6 
X-CRM114-Status: GOOD (  21.73  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTI6NTDigK9BTSBBdXJlbGllbiBKYXJubyA8YXVyZWxp
ZW5AYXVyZWwzMi5uZXQ+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiAyMDI2LTA5LTI0IDEwOjU3LCBn
YW8ucnVpQHp0ZS5jb20uY24gd3JvdGU6Cj4gPiBUaGUgUklTQy1WIFpiYiBvcHRpbWl6ZWQgc3Ry
bmxlbigpIGltcGxlbWVudGF0aW9uIGNhbiByZXR1cm4gaW5jb3JyZWN0Cj4gPiByZXN1bHRzIHdo
ZW4gdmVyeSBsYXJnZSBjb3VudCB2YWx1ZXMgYXJlIHN1cHBsaWVkLgo+ID4KPiA+IFRoZSBwcmV2
aW91cyBpbXBsZW1lbnRhdGlvbiBjYWxjdWxhdGVzIGFuIGVuZCBhZGRyZXNzIGJhc2VkIG9uIHRo
ZQo+ID4gaW5wdXQgcG9pbnRlciBhbmQgY291bnQuIFdoZW4gY291bnQgaXMgY2xvc2UgdG8gU0la
RV9NQVgsIHRoZSBhZGRyZXNzCj4gPiBjYWxjdWxhdGlvbiBtYXkgb3ZlcmZsb3csIHJlc3VsdGlu
ZyBpbiBpbmNvcnJlY3QgdGVybWluYXRpb24gY2hlY2tzIGFuZAo+ID4gd3JvbmcgcmV0dXJuIHZh
bHVlcy4KPiA+Cj4gPiBUaGlzIGlzc3VlIHdhcyBvYnNlcnZlZCB3aGlsZSBydW5uaW5nIGRldmlj
ZS1tYXBwZXIgdGVzdHM6Cj4gPgo+ID4gZG1zZXR1cCBjcmVhdGUgdGVzdG5hbWU5IC0tdGFibGUg
IjAgOCB6ZXJvIgo+ID4gY2F0IC9zeXMvYmxvY2svZG0tKi9kbS9uYW1lCj4gPiBkbXNldHVwIHJl
bW92ZSB0ZXN0bmFtZTkKPiA+Cj4gPiBSZXdvcmsgdGhlIFpiYiBpbXBsZW1lbnRhdGlvbiB0byB1
c2UgYSBkZWNyZW1lbnRpbmcgd29yZCBjb3VudGVyLgo+ID4gVGhpcyByZW1vdmVzIHRoZSBkZXBl
bmRlbmN5IG9uIGVuZC1hZGRyZXNzIGNhbGN1bGF0aW9ucywKPiA+IGF2b2lkcyBvdmVyZmxvdyBl
bnRpcmVseSwgYW5kIHNpbXBsaWZpZXMgdGhlIHdvcmQgc2Nhbm5pbmcgbG9vcC4KPiA+Cj4gPiBQ
ZXJmb3JtYW5jZSB3YXMgZXZhbHVhdGVkIHdpdGggc3RyaW5nX2JlbmNoX3N0cm5sZW46Cj4gPgo+
ID4gTmV3IEltcGxlbWVudGF0aW9uIFByZXZpb3VzIEltcGxlbWVudGF0aW9uCj4gPgo+ID4gbGVu
PTAgOiA3MCBucy9jYWxsIDcwIG5zL2NhbGwKPiA+IGxlbj0xIDogODEgbnMvY2FsbCA4MSBucy9j
YWxsCj4gPiBsZW49NyA6IDgxIG5zL2NhbGwgODEgbnMvY2FsbAo+ID4gbGVuPTggOiA4MSBucy9j
YWxsIDgxIG5zL2NhbGwKPiA+IGxlbj0xNiA6IDk3IG5zL2NhbGwgOTAgbnMvY2FsbAo+ID4gbGVu
PTMxIDogMTE5IG5zL2NhbGwgMTEzIG5zL2NhbGwKPiA+IGxlbj02NCA6IDE3NCBucy9jYWxsIDE2
MiBucy9jYWxsCj4gPiBsZW49MTI3IDogMjY0IG5zL2NhbGwgMjU4IG5zL2NhbGwKPiA+IGxlbj01
MTIgOiA4MDEgbnMvY2FsbCA4MjQgbnMvY2FsbAo+ID4gbGVuPTEwMjQgOiAxNTc4IG5zL2NhbGwg
MTU1MCBucy9jYWxsCj4gPiBsZW49MzE3MyA6IDQ1NDEgbnMvY2FsbCA0NzAzIG5zL2NhbGwKPiA+
IGxlbj00MDk2IDogNTk4NCBucy9jYWxsIDU5ODIgbnMvY2FsbAo+ID4KPiA+IFJlc3VsdHMgc2hv
dyBjb21wYXJhYmxlIHBlcmZvcm1hbmNlIHRvIHRoZSBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbgo+
ID4gd2hpbGUgZml4aW5nIHRoZSBvdmVyZmxvdyBpc3N1ZS4KPiA+Cj4gPiBGaXhlczogNWJhMTVk
NDE5ZmFiICgicmlzY3Y6IGxpYjogYWRkIHN0cm5sZW4oKSBpbXBsZW1lbnRhdGlvbiIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBHYW8gUnVpIDxnYW8ucnVpQHp0ZS5jb20uY24+Cj4gPgo+ID4gLS0tCj4g
PiB2MjoKPiA+IC0gUmV3b3JrIHRoZSBaYmIgaW1wbGVtZW50YXRpb24gdG8gZWxpbWluYXRlIGVu
ZC1hZGRyZXNzIG92ZXJmbG93Cj4gPiBpbnN0ZWFkIG9mIGZhbGxpbmcgYmFjayB0byB0aGUgZ2Vu
ZXJpYyBwYXRoLgo+ID4gLSBVc2UgYSBkZWNyZW1lbnRpbmcgd29yZCBjb3VudGVyIGZvciB3b3Jk
IHNjYW5uaW5nLgo+ID4gLSBSZXBsYWNlIG51bWVyaWMgbGFiZWxzIHdpdGggZGVzY3JpcHRpdmUg
bG9jYWwgbGFiZWxzLgo+ID4gLSBBZGQgY29tbWVudHMgZGVzY3JpYmluZyB0aGUgbG9vcCBzdHJ1
Y3R1cmUuCj4gPiAtIFJ1biBLVW5pdCBzdHJpbmcgdGVzdHMgc3VjY2Vzc2Z1bGx5Lgo+ID4gLSBB
ZGQgc3RyaW5nX2JlbmNoX3N0cm5sZW4gYmVuY2htYXJrIHJlc3VsdHMuCj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2xpYi9zdHJubGVuLlMgfCAxMTEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDYzIGRl
bGV0aW9ucygtKQo+Cj4gTm90ZSB0aGF0IHRoZSBmb2xsb3dpbmcgcGF0Y2ggd2FzIGFsc28gcG9z
dGVkLCB0byB3aGF0IEkgYmVsaWV2ZSBpcyB0aGUKPiBzYW1lIGlzc3VlOgo+Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvRExMSkRMS1BaNFMzLjFLUTVPNE9RQkJURVdAbGlu
dXguZGV2Cj4KCkkgdHJpZWQgYSBidWlsZCB3aXRoIHRoZSBwYXRjaCBmcm9tIHRoaXMgdGhyZWFk
IGFuZCBhbm90aGVyIGJ1aWxkIHdpdGgKdGhlIG9uZSBmcm9tIHRoZSB0aHJlYWQgeW91IGxpbmtl
ZC4gSW4gYm90aCBjYXNlcyB0aGUgVVVJRCBpcyBubwpsb25nZXIgdHJ1bmNhdGVkIGFuZCBJIHN1
Y2Nlc3NmdWxseSBib290ZWQgdGhlIGFmZmVjdGVkIGltYWdlIHdpdGggWkJCCmVuYWJsZWQuIEkg
ZG8gbm90IGtub3cgd2hpY2ggaXMgcHJlZmVyYWJsZS4KClRoYW5rIHlvdSwKSmFzb24gTW9udGxl
b24KCj4gUmVnYXJkcwo+IEF1cmVsaWVuCj4KPiAtLQo+IEF1cmVsaWVuIEphcm5vICAgICAgICAg
ICAgICAgICAgICAgICAgICBHUEc6IDQwOTZSLzFEREQ4QzlCCj4gYXVyZWxpZW5AYXVyZWwzMi5u
ZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
