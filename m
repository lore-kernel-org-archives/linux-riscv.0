Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FFAC25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsfqKMHaWZsGL2xszrAce3nvf0/6VQEMsLXboiyvLQU=; b=4pV+1fbNrN8HSa
	xDSKtWi2LA8kfOhiT14LueR1DsMXSHvvtoW/q+tuvn/Ey8Ndi9B91J6nYJpzwSGgAcFfKJoNnb0ym
	Fyyh+7DaJfrNQBBlrY01zhaA3PV6GBdkEjmVUwlOHLFYnqOlVnzcRQ72xBSHO5vZ4hJG9LYuaGLQl
	9wYJKia711z+9kEypwPPsreURatFRqkD2ya9SxcCc+Wq220yQ+Dpn2mq3VGtC5x5hcUkhoPZWBuZb
	fMtY+KtAALwlRKQESjqaSvzCxT265WrkPtMjclrD7pFJtevpO0cE3oyqnR1QF5j/vqF52pZnYav5j
	BjN05uLGzR0eyCYOesZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHgi-00Fr3x-2S;
	Fri, 27 Oct 2023 07:55:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHgg-00Fr3L-13
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 07:55:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698393320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9MwbxYo3Zz+s8wlirve5DUtjL3E5sUtORHfIvxUsRc=;
	b=zY4beSu/dNr7NSzuAbiWXWwCRmzGSK8niU5q5UR/0g8S9qhdBxuJyuH1QleEkLkPii7RX8
	ZaQA/FbxAD7rHKfdqfs6VjMiAKZ6Vb+6tGAxWnr3H7T3msT7UsA9ti+wxoOnEKZY7JNB0B
	KUDHObh+oRFHpkWfN7hJg/hs5drG8HezUaAMhV6yPcXZfehpNoByScCxZf2SoTM4gNSAg9
	lFb/zT9P0YtWMGwJuAIZ1TtCrtp+hqQ58K7j+mRlzPQgZ8WL0ElGisdCAzRz2GTbtz8cWb
	Ymqyb2HkdJN4AmIrcUJxS1diVFgvVT2gqae/T4ego5l7trEC1TlC3Uke8QkiWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698393320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9MwbxYo3Zz+s8wlirve5DUtjL3E5sUtORHfIvxUsRc=;
	b=lP8/WtOtKOMDyrsK6buyb7JVHrWWMzUf/RiJr1PjEWwjhrVbk4cxhJpDcWOQamu+VfrIRj
	JzACS02tOWD7cKBw==
To: Xu Lu <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 maz@kernel.org, anup@brainfault.org, dengliang.1214@bytedance.com,
 liyu.yukiteru@bytedance.com, sunjiadong.lff@bytedance.com,
 xieyongji@bytedance.com, lihangjing@bytedance.com,
 chaiwen.cc@bytedance.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>
Subject: Re: [External] Re: [RFC 00/12] riscv: Introduce Pseudo NMI
In-Reply-To: <CAPYmKFuNr18_jJYZ6X4Rrty=bU0cXiuHpAqSt2+YqDWV6rAveg@mail.gmail.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
 <CAOnJCUKH0muFHWujXEqJtb4Uv6Kfh5DeJeR2qg9vj7Kc5w43dw@mail.gmail.com>
 <CAPYmKFuNr18_jJYZ6X4Rrty=bU0cXiuHpAqSt2+YqDWV6rAveg@mail.gmail.com>
Date: Fri, 27 Oct 2023 09:55:19 +0200
Message-ID: <874jic4hzs.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_005522_506477_A694EF59 
X-CRM114-Status: UNSURE (   7.58  )
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

T24gVGh1LCBPY3QgMjYgMjAyMyBhdCAyMTo1NiwgWHUgTHUgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MjYsIDIwMjMgYXQgNzowMuKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+
IHdyb3RlOgo+IEZpcnN0LCBwbGVhc2UgYWxsb3cgbWUgdG8gZXhwbGFpbiB0aGF0IENTUl9JRSBQ
c2V1ZG8gTk1JIGFjdHVhbGx5IGNhbiBzdXBwb3J0Cj4gbW9yZSB0aGFuIFBNVSBwcm9maWxpbmcu
IEZvciBleGFtcGxlLCBpZiB3ZSBjaG9vc2UgdG8gbWFrZSBleHRlcm5hbCBtYWpvcgo+IGludGVy
cnVwdCBhcyBOTUkgYW5kIHVzZSBpdGhyZXNob2xkIG9yIGVpdGhyZXNob2xkIGluIEFJQSB0byBj
b250cm9sIHdoaWNoIG1pbm9yCj4gZXh0ZXJuYWwgaW50ZXJydXB0cyBjYW4gYmUgc2VudCB0byBD
UFUsIHRoZW4gd2UgYWN0dWFsbHkgY2FuIHN1cHBvcnQgbXVsdGlwbGUKPiBtaW5vciBpbnRlcnJ1
cHRzIGFzIE5NSSB3aGlsZSBrZWVwaW5nIHRoZSBvdGhlciBtaW5vciBpbnRlcnJ1cHRzIHN0aWxs
Cj4gbm9ybWFsIGlycXMuCgpXaGF0IGlzIHRoZSB1c2UgY2FzZSBmb3IgdGhlc2UgTk1Jcz8gQW55
dGhpbmcgZWxzZSB0aGFuIHByb2ZpbGluZyBpcyBub3QKcmVhbGx5IHBvc3NpYmxlIGluIE5NSSBj
b250ZXh0IGF0IGFsbC4KClRoYW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
