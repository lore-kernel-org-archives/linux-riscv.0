Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D495606A33E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zsiy2E3R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Mime-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sjERH/C+tO6utpf7PiGvyJ/Vf/sxDB157rePCytqf0g=; b=Zsiy2E3R8e6x42+NE0k4faBrFX
	BIJ+GeAiyAhf62W/Vh1n5aZ0QutJPxGESECAcMVZ1dwtlYTtyEC8yLxFrBwmYJIIZcN3b8/tcejUz
	9PM2ybYfVwgf9XykXYNVICU555nfEU3Et0RH6XMOZH+Dyym89PWilGEW5EyGQwaM6iukPnBZKV1ck
	R1ve3VQ1jeEu+5Jz8EHDNUubVxJSWpTa5TWI4K5Y3bt2LQF58ZBVV7IEDj602QZW8VRPYxHCpTffa
	VGgLkIyI5rARN73kRDmAR56j4QF5+OpRT8FD6SgEcjPT0BMmgWU/kV7VP0OoUP7IMhr4yDNui6bE3
	A/lIGXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC0x-00000001U0t-2Pup;
	Sun, 22 Nov 2026 18:10:11 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC0u-00000001Tzn-1XFw
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 18:10:10 +0000
EX-QQ-RecipientCnt: 8
X-QQ-GoodBg: 2
X-QQ-SSF: 0040000000000040
X-QQ-FEAT: D4aqtcRDiqS21hctRIwgrWppQSBgmW2wb6dRneOslG0=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: ssPzF9ThNV/vUaMJznugGAsWDLKqtAwhOAZ8ZpSZRvs=
X-QQ-STYLE: 
X-QQ-mid: v3sz3b-12t1795370946t337e6a40
From: "=?utf-8?B?6buE5Y2O5oiQ?=" <1112433017@e.gzhu.edu.cn>
To: "=?utf-8?B?bGludXgtcmlzY3Y=?=" <linux-riscv@lists.infradead.org>
Cc: "=?utf-8?B?cGFsbWVy?=" <palmer@dabbelt.com>, "=?utf-8?B?cGp3?=" <pjw@kernel.org>, "=?utf-8?B?YW91?=" <aou@eecs.berkeley.edu>, "=?utf-8?B?YWxleA==?=" <alex@ghiti.fr>, "=?utf-8?B?ZGVidWc=?=" <debug@rivosinc.com>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: [PATCH 0/1] riscv: usercfi: bind signal shadow-stack restore to the active shadow stack
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 23 Nov 2026 02:09:06 +0800
X-Priority: 3
Message-ID: <tencent_009592B86559C9177427E98A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 4503553002980438403
X-Address-Ticket: version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 23 Nov 2026 02:09:07 +0800 (CST)
Feedback-ID: v:e.gzhu.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4WhQbLQyIqSuvWlBh58XioR6WOTTPxNT25mudBrnCIRfrZugK+43r3f
	XUFrjVOwmR2GkADKDnEGQuOTP0mpTuHIfWVuBA2FBu5a9YcINP24oNA0f8lCKnO6KlxxtWa
	NsUoP40qC4Rs8Sx12S6LZN5pdpU1u4lYxYdxW46Ww5ybTJdibTTLcmFUEjyPiROfMBu9HiN
	Hb2SIpZJ9pGBNbKHYo3W2t4yG7StbUS1/Berh0FXx5nK23pkI7w/gaVkBTMtw0Hoa86Uplk
	SAFuERNj7ecvV8xTDVANb0L+Dmku4zM2ws8WwVnc+SGzIYO+DgQWxWNmL3S3McKXJc4puYE
	u0QgzMxfNB3za7eYUaU/xzWAt0cML7q37mbPoIuMWbQYNdM8Gm8YHAacP4EwU2KD0/58Tli
	EZcU4ljgCb/445UWMaYmaY0eo4NwHsBdtFRmuI2y+D4ZqLA4ZZ0YVV9DtCEvVXc76Qc41MC
	Wd+UPcjqRuta/YPSBTVtvNOzBbo7gFIjDawlylXQ7/kTKjsM5D6e61oCdcB5PS7931sIRzC
	ceCJzmvEJS/Hdc30g1wOYwETFmMj/C2CuXz55CP+5rabewQ475oJ5fCRsaovnij1BJQczjv
	fJhXICJu0Eu8bMZLKchoCd7u4gpZrJTgYXLJy0l0U4pbQJ87HNqesm/MkTobiwIY7LS4WHH
	6cXshbtl2rMZrezFlej3/N/VtHd3SpudGvkXdpfswN3jkmu6w1kmCjMD4Y1kwgTuG+oklIS
	sRPUYg3E4zTaC1EdlBJ0fQgP3qVKs0rDxdEXW9byZpJJTkYwL+PReSrAJzU1WK7rKKPYFp6
	8lYL9+suCzqD5QANT60C6MocZUPRS1ncKqGL9vFebhrCVGAFlmC7Q5uzItEfnmp6MqaXZOx
	AiedjZEiNFdkxF1FQKc2SBHDMqLxwqXafa1vWYM/Jvee8xEVmPOpbpXjjkSr2fAEUzmAx1u
	U4m38myTR/WL9oYhQ5+n34iPrQKem3zPXGgLY8PhVnEqxa2mAit5JUS4w
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101008_809250_4AF5C1A3 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sV2hpbGUgYXVkaXRpbmcgdGhlIHNpZ25hbCBwYXRoIG9mIHRoZSBSSVNDLVYgdXNlcmNm
aSBpbXBsZW1lbnRhdGlvbiAoWmljZmlzcyBzaGFkb3cgc3RhY2tzKSBhZ2FpbnN0IHg4NiBDRVQg
YW5kIGFybTY0IEdDUywgd2UgZm91bmQgdGhhdCByZXN0b3JlX3VzZXJfc2hzdGsoKSB2YWxpZGF0
ZXMgdGhlIHJlc3RvcmUgdG9rZW4gb25seSBieSBhIHZhbHVlIHJlbGF0aW9uICh0b2tlbiA9PSBz
aHN0a19wdHIgKyBTSFNUS19FTlRSWV9TSVpFKSBhdCBhIHBvaW50ZXIgdGFrZW4gZnJvbSB0aGUg
dXNlciBzaWduYWwgZnJhbWUgKHNjX2V4dGRlc2Muc3NfcHRyKSwgd2l0aG91dCBiaW5kaW5nIHRo
YXQgcG9pbnRlciB0byB0aGUgc2hhZG93LXN0YWNrIHBvc2l0aW9uIHRoZSBrZXJuZWwgaXRzZWxm
IHJlY29yZGVkIGF0IHNpZ25hbCBkZWxpdmVyeS5BIGNvcnJ1cHRlZCBzaWdmcmFtZSBjYW4gdGhl
cmVmb3JlIHBvaW50IHRoZSByZXN0b3JlIGF0IGEgc3RhbGUgYnV0IHN0aWxsLWxpdmUgdG9rZW4g
ZnJvbSBhbm90aGVyLCBuZXZlci1yZXN0b3JlZCBzaWduYWwgY29udGV4dCAodGhpcyBpcyBhbiBp
bi1ib3VuZHMsIGdlbnVpbmVseSB2YWxpZCB0b2tlbiwgc28gaXQgcGFzc2VzIHRoZSBib3VuZHMg
Y2hlY2sgYWRkZWQgYnkgZGYzMzNiNzJjMGUxKS4gIFRoZSBrZXJuZWwgdGhlbiBzd2FwcyB0aGUg
dG9rZW4gb3V0IGFuZCByZXdpbmRzIHNzcCB0byB0aGF0IHRva2VuJ3MgcG9zaXRpb24gLSBhbiBh
dHRhY2tlci1jaG9zZW4gaGlzdG9yaWNhbCBzaGFkb3ctc3RhY2sgZGVwdGggLSBhZnRlciB3aGlj
aCBzc3BvcGNoaygpIHZhbGlkYXRlcyBhIHJldHVybiBhZGRyZXNzIHRoYXQgaXMgb25seSAidmFs
aWQiIGF0IHRoZSByZXdvdW5kIGRlcHRoLiAgV2UgY2FsbCB0aGlzIHJlcGxheSBjbGFzcyBBLVJF
V0lORC4gIHg4NiBDRVQgZG9lcyBub3QgaGF2ZSB0aGlzIHNoYXBlOiBpdHMgc2lnZnJhbWUgY29u
dGFpbnMgbm8gc2hhZG93LXN0YWNrIHBvaW50ZXIgYXQgYWxsIGFuZCB0aGUgdG9rZW4gaXMgcmVh
ZCBmcm9tIHRoZSBrZXJuZWwtY3VycmVudCBTU1AuVGhyZWF0IG1vZGVsOiB0aGUgYXR0YWNrZXIg
YWxyZWFkeSBoYXMgYSBtZW1vcnktY29ycnVwdGlvbiBwcmltaXRpdmUgc3VmZmljaWVudCB0byBj
b3JydXB0IHRoZSBzaWdmcmFtZS4gIFRoYXQgaXMgZXhhY3RseSB0aGUgdGhyZWF0IG1vZGVsIHNo
YWRvdyBzdGFja3MgZXhpc3QgZm9yLCBzbyB0aGUgcmVzdG9yZSBwYXRoIG11c3Qgbm90IHdpZGVu
IGl0IGludG8gYSBjb250cm9sbGVkIENGSSBieXBhc3MuV2UgZGVtb25zdHJhdGVkIHRoZSBmdWxs
IGNoYWluIGVuZCB0byBlbmQgb24gYSBmdWxseSBoYXJkZW5lZCB0YXJnZXQgKFBJRSArIEFTTFIg
KyBjYW5hcnkgKyBGdWxsIFJFTFJPICsgTlggKyByZWFsIGNsYW5nIFppY2Zpc3MgaW5zdHJ1bWVu
dGF0aW9uLCBydW5uaW5nIHVuZGVyIExpbnV4L3Jpc2N2NjQgdXNlcmNmaSk6IHRoZSBjb3JydXB0
ZWQgc2lncmV0dXJuIHJld2luZHMgc3NwIHRvIGEgY2hvc2VuIGRlcHRoLCBzc3BvcGNoayBwYXNz
ZXMgb24gdGhlIHJld291bmQgc2xvdCwgYW5kIGV4ZWN1dGlvbiByZXN1bWVzIGF0IGFuIGF0dGFj
a2VyLWNob3NlbiBzaXRlIHRoYXQgcGVyZm9ybXMgYSBwcm90ZWN0ZWQgYWN0aW9uIG9ic2VydmFi
bGUgb25seSB2aWEgdGhlIHJld2luZC4gIFdpdGggdGhlIHNpeC1saW5lIGJpbmRpbmcgYmVsb3cg
dGhlIHNhbWUgY2hhaW4gaXMgYmxvY2tlZCBhdCB0aGUga2VybmVsIGNoZWNrLlN0YXRpc3RpY3Mg
ZnJvbSAxMzAgaW5kZXBlbmRlbnQgZXhlY3ZlIHJvdW5kcyAoNzAgdW5wYXRjaGVkIC8gNjAgcGF0
Y2hlZCwgQVNMUiBvbik6IHVucGF0Y2hlZCA2Ny82NyBzdWNjZXNzIGFtb25nIHJvdW5kcyB0aGF0
IGNvbXBsZXRlZCByZWNvbm5haXNzYW5jZSAoMyByb3VuZHMgbG9zdCB0byBhIGxlYWstd2luZG93
IGFydGlmYWN0IHVucmVsYXRlZCB0byB0aGUgcGF0Y2gpOyBwYXRjaGVkIDUyLzUyIGJsb2NrZWQg
YW1vbmcgY29tcGxldGVkIHJvdW5kcy4gIE9mZmljaWFsIGtzZWxmdGVzdHMgKHJpc2N2L3NpZ3Jl
dHVybiwgc2lnbmFsL3Nhcywgc2lnbmFsL21hbmdsZV91Y19zaWdtYXNrKSBwYXNzIGlkZW50aWNh
bGx5IG9uIGJvdGgga2VybmVscywgYXMgZG8gbm9ybWFsL25lc3RlZC9zaWdhbHRzdGFjay8gc2ln
bG9uZ2ptcC9zZXRjb250ZXh0L3N3YXBjb250ZXh0IHNjZW5hcmlvcy4gIE92ZXJoZWFkIG9mIHRo
ZSBhZGRlZCBjb21wYXJpc29uIGlzIGJlbG93IG1lYXN1cmVtZW50IG5vaXNlIChzdWItbnMgbmF0
aXZlOyBUQ0cgcnVucyBzaG93IG5vIG1lYXN1cmFibGUgZGVsdGEgYWJvdmUgYm9vdC10by1ib290
IHZhcmlhbmNlKS5UaGUgZml4IHVzZXMgdGhlIGV4aXN0aW5nIGdldF9hY3RpdmVfc2hzdGsoKSBi
b29ra2VlcGluZyB0aGF0IHNhdmVfdXNlcl9zaHN0aygpIGFscmVhZHkgbWFpbnRhaW5zIGF0IGRl
bGl2ZXJ5LCBzbyB0aGUgYWRkZWQgY29zdCBhdCBzaWdyZXR1cm4gaXMgb25lIGNvbXBhcmlzb24u
ICBUaGUgcGF0Y2ggaXMgZ2VuZXJhdGVkIGFnYWluc3QgdGhlIHRyZWUgd2UgdmFsaWRhdGVkIG9u
OyBpdCB0cml2aWFsbHkgcmViYXNlcyAoc2luZ2xlIGh1bmsgaW4gcmVzdG9yZV91c2VyX3Noc3Rr
LCBwbGFjZWQgYWZ0ZXIgdGhlIGRmMzMzYjcyYzBlMSBib3VuZHMgY2hlY2spLlJlcHJvZHVjZXIg
KHByb2JlLCBzY3JpcHRzLCBwaW5uZWQga2VybmVsLWltYWdlIGhhc2hlcywgbG9ncykgYXZhaWxh
YmxlIG9uIHJlcXVlc3Qgb3IgdmlhIGEgYnJhbmNoLlRoYW5rcyxMb29raW5nIGZvcndhcmQgdG8g
eW91ciByZXBsee+8gQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
