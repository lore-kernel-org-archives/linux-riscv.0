Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA21EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uda/mrkPo0h2cqBEB9Mt9GSQFw8GVgpPXrSlxNob51k=; b=EcamME9zQwarD0
	JDels8dYBl/f18XQ4cPF3dBezwxwwmDDpKL83aWSgu4dUEt0L12mNzyB7sEGu20AzAOg4pJ1JqLHj
	7JLn5GTAAHjZzavSMf8b5f8vtO8VNomza42ob5NJ9HCucbsJACkpEUuXY4IFW9NthdPc22t54qhBI
	BVMNMAErC3RfT2HxvbujJ0+Z/0hIPKzhxHGdlFaRWfnPRlP9EX7b1t6LmxnHU8cMDfPd9KRz3u56y
	ouoMfqU3kNEbYtSHmDPP2mAmjmEv0xmHeHo3KUo+KrH5pOs9otqcexpj12JnrXOqHs6zrsxHpFAuO
	rhBdLNz2kkf2EOgJ8rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAHH-00DStG-2q;
	Tue, 27 Jun 2023 15:06:47 +0000
Received: from 2.mo550.mail-out.ovh.net ([178.32.119.250])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAHD-00DSrK-2L
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 15:06:45 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.1.13])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id A124A26D09
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:06:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9dk8g (unknown [10.110.208.139])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1FE0D1FEA3
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:06:36 +0000 (UTC)
Received: from courmont.net ([37.59.142.105])
	by ghost-submission-6684bf9d7b-9dk8g with ESMTPSA
	id cGqMBPz6mmTbUgAApSklDg
	(envelope-from <remi@remlab.net>)
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:06:36 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006a3e48bb4-d207-45c3-b3b9-58ff3891a01d,
                    923DF5A4D5D6DDC6A91A524DF2F2945B83EA8267) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: Discard vector state on syscalls
Date: Tue, 27 Jun 2023 18:06:33 +0300
Message-ID: <5684355.DvuYhMxLoT@basile.remlab.net>
Organization: Remlab
In-Reply-To: <87y1k6m827.fsf@all.your.base.are.belong.to.us>
References: <20230626165736.65927-1-bjorn@kernel.org>
 <87y1k6m827.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 18085611682613696967
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrtddtgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkfhojghfggfgtgesthhqredttddtjeenucfhrhhomheptformhhiucffvghnihhsqdevohhurhhmohhnthcuoehrvghmihesrhgvmhhlrggsrdhnvghtqeenucggtffrrghtthgvrhhnpeekvdelteetvddvveeuhfekiedtleekieelhfffvddtteetgfdugfdtkedtueelvdenucfkphepuddvjedrtddrtddruddpkeejrdelvddrudelgedrkeekpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgvmhhisehrvghmlhgrsgdrnhgvtheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_080643_943641_F90D9A92 
X-CRM114-Status: UNSURE (   6.07  )
X-CRM114-Notice: Please train this message.
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

W1Jlc2VuZCB3aXRoIGRpZmZlcmVudCBNVEFdCgpMZSAyNiBqdWluIDIwMjMgMTk6NDU6MjAgR01U
KzAyOjAwLCAiQmrDtnJuIFTDtnBlbCIgPGJqb3JuQGtlcm5lbC5vcmc+IGEgw6ljcml0IDoKPkJq
w7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyaXRlczoKPgo+PiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+Cj4+IFRoZSBSSVNDLVYgdmVjdG9yIHNwZWNp
ZmljYXRpb24gc3RhdGVzOgo+PiAgIEV4ZWN1dGluZyBhIHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwg
Y2FsbGVyLXNhdmVkIHZlY3RvciByZWdpc3RlcnMKPj4gICAodjAtdjMxLCB2bCwgdnR5cGUpIGFu
ZCB2c3RhcnQgdG8gYmVjb21lIHVuc3BlY2lmaWVkLgo+Cj5BIGJpdCBvZiBhIGNvcm5lciBjYXNl
LCBidXQgdGhpcyB3aWxsIG1ha2Ugc2lncmV0dXJuIHN5c2NhbGxzIGRpc2NhcmQKPnRoZSB2ZWN0
b3Igc3RhdGUgYXMgd2VsbC4KPgo+SXMgdGhhdCBhbiBpc3N1ZT8gRS5nLiBhIHVzZXIgY2Fubm90
IGJ1aWxkIHVzZXJzcGFjZSBjb250ZXh0IHN3aXRjaGluZwo+YXBwbGljYXRpb24uIERvZXMgYXJt
NjQgU1ZFIGhhbmRsZSBzaWdyZXR1cm4gaW4gYSBzcGVjaWFsIHdheT8KCklzbid0IHNpZ3JldHVy
bigpIHN1cHBvc2VkIHRvIHJldHVybiB0aGUgc3RhdHVzIGZyb20gdGhlIGFyY2gtZGVwZW5kZW50
IAptYWNoaW5lIHN0YXRlIHdpdGhpbiB0aGUgc2lnaW5mbyBzdHJ1Y3R1cmUsIHJhdGhlciB0aGFu
IHdoYXRldmVyIHdhcyBzYXZlZCBvbiAKc2lncmV0dXJuKCkgc3lzY2FsbCBlbnRyeT8gVGhhdCBi
ZWluZyB0aGUgY2FzZSwgSSB0aGluayB0aHJvd2luZyB0aGUgdmVjdG9yIApyZWdpc3RlciBiYW5r
IGF3YXkgb24gKmVudHJ5KiBvZiBzaWdyZXR1cm4oKSBpcyBmaW5lIGFzIHdpdGggYW55IG90aGVy
IHN5c2NhbGwsIApidXQgdGhlIHN0YXRlIG11c3QgKm5vdCogYmUgY2xlYXJlZCBvbiBzeXNjYWxs
IGV4aXQuCgpBbiBleGFtcGxlIHVzZWNhc2Ugd291bGQgYmUgZW11bGF0aW5nIFJWViBleHRlbnNp
b25zIChvbiBhIENQVSBzdXBwb3J0aW5nIApiYXNlbGluZSBSVlYgMS4wKSB3aXRoIGEgU0lHSUxM
IGhhbmRsZXIuCgotLSAKUsOpbWkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
