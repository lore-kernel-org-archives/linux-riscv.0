Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9444C55162
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJ3IRdudhcX33UboR3jf6qAxj7wABIB0+XwQFfh4+FQ=; b=b1o26ZkMnlxGYV
	72f2TZSik8ez2nV24Emu/RD/87/cCxf+zu79R+RVMzT97kKh910RGP81OYnmOR8fy8ukZTXZX32x5
	mK/A849Goqx/10GDGVCUT1PFiPUzW0/z0lDGtdUS5U+R1KfVirOLSMDyrQbYMMy9am6EnW9N9DqKx
	luwlTOIJUbNrXZJ3XSH18mWiUJ6y2uSl6PcsJwB4cZLP5s2Lpf18NT22AdwiNAc1+8z8udE2MEZ5A
	CCeDavr7uk/A+n9TEnnVDdTT4qC5U62HfEGC8qvB2aOE14xXqM5UtKZ1iLrk6s4I/Qm/4ONyeCEdn
	59OUq6DwkK80B+JbUCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRXy-0000000AirK-0BDa;
	Thu, 30 Jul 2026 14:15:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRXv-0000000AiqD-1LfB
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 14:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785420936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ndx849z6yjZqJUha2L0Lgh82EmzNPnb5x+ZtAMnjxCI=;
	b=TnSRrTB5vIsF17czzoZUpKKBboF5KI07QpUG1kiEmlHcPokEFw+Kj/iQg7J63KQqy2zitE
	dPkgAwKuoUan+KOvYfPSm8kXmYbgg/9nTW7a15F+UCMs5GSorkWfKo2Q6BAV0ImVNZ1YQE
	Fe4gMYYA6Rs6LRexyE5uQ6xXVATG49c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-qXEoOB5ROAyU4t2P_5G69w-1; Thu, 30 Jul 2026 10:15:33 -0400
X-MC-Unique: qXEoOB5ROAyU4t2P_5G69w-1
X-Mimecast-MFC-AGG-ID: qXEoOB5ROAyU4t2P_5G69w_1785420932
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495495ad5ddso14207975e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 07:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420932; x=1786025732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ndx849z6yjZqJUha2L0Lgh82EmzNPnb5x+ZtAMnjxCI=;
        b=KBeZfEi/s2qMk8sezCi/MAC/qGUelngyFSC49vtmdihpswGENKmb3QbWWlI1rEbg8n
         okbEYduTwnC/bmWdRKLSArPPWhvLZDsBASWgC+zclAicTWLOTCXlETjh8fjFpWXzUdGO
         daD1pcGras6bUzDG9Sw3OVLSNgihEFSlE7e5ORson2nbMy59GCKs5RT3T28HpxepU3Fq
         bodwHHkiApQhQWhNdRpvpQFQV9nC0qH/5v8neo2hJZZIKXghCheGlmNl6cnqKYCtyRaI
         71l4mP5fB8msgt2H7PxZ9u7C9Z+5E0to82zDlq0Cwm2H4y3mCnBEIEMyoFUeJmxGi1HU
         eeRA==
X-Forwarded-Encrypted: i=1; AHgh+Rrze0YUFRnHbzmDUsWsIGWKFw72rQcJQz+aJgXUhr9k5pJyLbAWjF0rM2fE9qIrepYX3e09FEOYF2HFXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdaIUFz8NWECxb2AyiK78ZEEOXGX1hDLn/VG8r4s36VES+FpxC
	wDQSky3DiwwTquyalabtWOakBoofvtzenStGQxu3LL/CwAFau6NGeWCk3QJH0qTZqFGgqfkDDK8
	TzGt4QiT6Ag8uHllPikQczSCxHPGFVG+KVo50PkISkT9g+OPA4TuUYgOLtkryzB7PcARwqMu6Aj
	qkTMYb6JCF0BuwCEGOE0e6rd1omwqrrS9vacA9qFRMRrNm
X-Gm-Gg: AR+sD113jITyzg1RaoSDa/3WLxFufZ2yQCsRfELIO/18QD+h1dhpnRWrO7b7Q39mted
	/Soi9Pjiiiyj/A1X9ky40LX+AjjUF0w2FaN1owA+FCr6Y9Cq5W3CPXbN2oh8pTKXJG8MmPn87FY
	vg92OFSmHq5xgMaF/7rJimharl7kJLXFvM3i2KLUCRiExXKMv08yePHzfLSNNIalYP5FLU7Ieuy
	v7EiS8z3gD7CeBJAA==
X-Received: by 2002:a05:600c:4e46:b0:495:52db:7e8 with SMTP id 5b1f17b1804b1-49800ea2b02mr39536895e9.19.1785420932348;
        Thu, 30 Jul 2026 07:15:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4e46:b0:495:52db:7e8 with SMTP id
 5b1f17b1804b1-49800ea2b02mr39536225e9.19.1785420931779; Thu, 30 Jul 2026
 07:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260730131931.2066821-1-namcao@linutronix.de>
In-Reply-To: <20260730131931.2066821-1-namcao@linutronix.de>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Thu, 30 Jul 2026 10:15:19 -0400
X-Gm-Features: AUfX_mz8JaVuTYTJTZf4SFBs-OSLvjSuplttm8-6mG_CdRNhz6SB8MuCWTZl3Hw
Message-ID: <CADRr4bcMNe5K=W=vfqqM2nWVj-H02QadHaQS_QjO9D4htwT_fw@mail.gmail.com>
Subject: Re: [PATCH] riscv: unaligned: Fix check_vector_unaligned_access()
 stub name
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z5hUh-m0Ka70BnkMWQRej4YRVKJzcC1S3CRDSfokXzU_1785420932
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_071539_440538_19B79033 
X-CRM114-Status: GOOD (  15.58  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgOToxOeKAr0FNIE5hbSBDYW8gPG5hbWNhb0BsaW51dHJv
bml4LmRlPiB3cm90ZToKPgo+IFdoZW4gQ09ORklHX1JJU0NWX1BST0JFX1ZFQ1RPUl9VTkFMSUdO
RURfQUNDRVNTPW4sIHRoZSBuby1vcCBzdHViIGZvcgo+IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRf
YWNjZXNzKCkgaGFzIHRoZSB3cm9uZyBuYW1lIGFuZCBjYXVzZXMgY29tcGlsZQo+IGZhaWx1cmUu
Cj4KPiBDb3JyZWN0IHRoZSBuYW1lLgo+Cj4gRml4ZXM6IGY1NGQxOTNkYjVkYSAoInJpc2N2OiB1
bmFsaWduZWQ6IHN0b3AgdXNpbmcga3RocmVhZCBmb3IgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9h
Y2Nlc3MoKSIpCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDcz
MDE2MTgueXJFM0VLZlMtbGtwQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxu
YW1jYW9AbGludXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqdGF1YmVwZUBy
ZWRoYXQuY29tPgoKPiAtLS0KPiBUaGlzIHBhdGNoIGNhbiBhbHNvIGJlIHNxdWFzaGVkIHRvIGY1
NGQxOTNkYjVkYS4KQWdyZWVkCgpUaGFua3MsCkplc3NlIFRhdWJlCgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+IGluZGV4IDUyMTJhYTk5NzcxZS4uNmUzNWJjYTU2
OGRlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+
IEBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9h
Y2Nlc3Moc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXMKPiAgfQo+Cj4gICNl
bHNlIC8qIENPTkZJR19SSVNDVl9QUk9CRV9WRUNUT1JfVU5BTElHTkVEX0FDQ0VTUyAqLwo+IC1z
dGF0aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yayBfX2Fsd2F5c191bnVzZWQpCj4gK3N0YXRpYyB2b2lkIGNoZWNrX3ZlY3Rvcl91bmFs
aWduZWRfYWNjZXNzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpCj4g
IHsKPiAgfQo+ICAjZW5kaWYKPiAtLQo+IDIuNDcuMwo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
