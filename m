Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7950EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRPr6XBeQ/yFbO2LiuFdyLt+puVkwTfm//PPf3T1O9s=; b=Tqz260n8kSqzsp
	Lh/WiirshWWo0MbMwgeelNlDTsPakjSCZzA2lu4nYvWvurQn/6OO5ouLiehl0Ikv8NJEwDloHNi/z
	QWOvStdrUa22lbR40th6rAPf4Rsid4EfYx2WH0e5m1EoZEPfMtZ9R+bes6J2WsK56jlfOo2IK/26H
	7BL46yGhu8u1YgzjX5rUk4rJ9yuGxvMw4JNSci1GaDeFiaPYBueZ7Xf0STI3Y48lE3CBH7h49JWdW
	KjE/kGL/U06u6qV6JRLr6q1dhhG5tpwwWi9xiHhZoof0RpnBlqfaE6eYuAxnCE+hoZw8WZZHItezo
	/73Df3aqj3a0+aTz3mOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Qg-005bJM-30;
	Wed, 19 Jul 2023 06:12:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Qf-005bI9-1J
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gmW/N4xFcOzTxfze6AKxSxFwu91xt3CbT96PKVeZmNc=; b=Ht92KgPSGJEc8Q8QAgFrRQtnK+
	Rv27ILrAGADKeHiUzUALfABY+07qYOYaGAQEplHGmshweNE183e3HMxX2QRWBcpTxgqfFjcYhVeiz
	GVtZcHCbHScegca/0H/dfxJ/KK7IQUbVlc7mf93WeT3yGro7Z7MFZY+HoqrabTJvd1zT1zkHHD5B0
	tvAZaRqaQbL++te359+4Rs/XhFcymodzdWQdPKfEArCZgvO1sOyGNcl1HOW7sfDkUgydj0mDVaEdL
	ch0fY/4II6+TtQekm8CI50gBPI/kuSfb6IiBKCXFX2zvs2Hkp6WNKO8GYfP21hlM35uaMZ9EeU1by
	MMFzlubw==;
Received: from 6.mo560.mail-out.ovh.net ([87.98.165.38])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLq0E-00Bve1-3B
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 19:05:01 +0000
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.16.32])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 3D40825E7E
	for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 19:04:47 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-g6sfr (unknown [10.110.103.4])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5EA4F1FDBD;
	Tue, 18 Jul 2023 19:04:46 +0000 (UTC)
Received: from courmont.net ([37.59.142.109])
	by ghost-submission-6684bf9d7b-g6sfr with ESMTPSA
	id hDu6EU7itmQ5AgAA6V/YAg
	(envelope-from <remi@remlab.net>); Tue, 18 Jul 2023 19:04:46 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003d480a6fd-102e-4f80-8590-9c2f09ff353c,
                    3111FEB0E50A85C15A7B3C8E702AC4BF574C28F6) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>,
 Jan Newger <jannewger@google.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
Date: Tue, 18 Jul 2023 22:04:45 +0300
Message-ID: <8756384.Zvl9fuB8X0@basile.remlab.net>
Organization: Remlab
In-Reply-To: <CAOnJCUJreDYWZcSRr-pb1vwRg_LyU7TBG+b_9Ys8rVmM8_fvgA@mail.gmail.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <4761144.fSbbhVQpq0@basile.remlab.net>
 <CAOnJCUJreDYWZcSRr-pb1vwRg_LyU7TBG+b_9Ys8rVmM8_fvgA@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16307252779307833786
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeftrohmihcuffgvnhhishdqvehouhhrmhhonhhtuceorhgvmhhisehrvghmlhgrsgdrnhgvtheqnecuggftrfgrthhtvghrnhephedujedulefftedvvefgueehjeekhfeukeegtdeijefgheevgeehkeekhedtleeknecuffhomhgrihhnpehffhhmphgvghdrohhrghdprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_200457_274296_3A6A4BF5 
X-CRM114-Status: GOOD (  14.40  )
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

TGUgdGlpc3RhaW5hIDE4LiBoZWluw6RrdXV0YSAyMDIzLCAyMS40NS4xNSBFRVNUIEF0aXNoIFBh
dHJhIGEgw6ljcml0IDoKPiA+IEkgYWdyZWUgdGhhdCBpdCdzIG5vdCBvbmx5IGluc2VjdXJlIGJ1
dCBhbHNvIGluY29ycmVjdC4gSG93ZXZlciBpdCBtb3N0bHkKPiA+IHdvcmtzLiBJbiBmYWN0IEkg
ZG9uJ3QgZGlzYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGFzIHN1Y2gsIGJ1dCBJIHRoaW5rIHRoYXQK
PiA+IHRoZSBjb21taXQgbWVzc2FnZXMgYXJlIG1pc2xlYWRpbmcgYW5kIGNvbmZ1c2luZy4gRm9y
IGEgc3RhcnQsIGluIG9uZQo+ID4gcGxhY2UgaXQgc2F5cyB0aGF0IGl0IGlzIG5vdCBicmVha2lu
ZyB1c2VyIHNwYWNlIGFuZCBpbiBhbm90aGVyIGl0IHNheXMKPiA+IGJhc2ljYWxseSB0aGUgb3Bw
b3NpdGUuCj4gCj4gQWdyZWVkLiBXZSB3aWxsIGltcHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlIHRv
IGNsYXJpZnkgdGhhdC4gVGhhdCdzIGFsc28gdGhlCj4gcmVhc29uIEkgc3RhcnRlZCB0aGlzIHdo
b2xlIHRocmVhZCA6KQo+IAo+ID4gKFVuZm9ydHVuYXRlbHksIG5vdCBldmVyeWJvZHkgYWdyZWVz
IHdpdGggdGhlIGNoYW5nZS4gSSBjYW4ndCBzZWVtIHRvIGdldAo+ID4gRkZtcGVnJ3MgY2hlY2th
c20gdG9vbCBmaXhlZDoKPiA+IGh0dHA6Ly9mZm1wZWcub3JnL3BpcGVybWFpbC9mZm1wZWctZGV2
ZWwvMjAyMy1KdWx5LzMxMjI0NS5odG1sICkKPiAKPiBXaHkgY2FuJ3QgcmR0aW1lKGVxdWl2YWxl
bnQgb2YgcmR0c2MpIGJlIHVzZWQgaW5zdGVhZCBvZiByZGN5Y2xlID8KCklzbid0IFJEVElNIHN1
c2NlcHRpYmxlIHRvIGludGVyZmVyZW5jZSBmcm9tIHBvd2VyIG1hbmFnZW1lbnQgYW5kIENQVSAK
ZnJlcXVlbmN5IHNjYWxpbmc/IEkgc3VwcG9zZSB0aGF0IFJEQ1lDTEUgbWF5IGJlaGF2ZSBkaWZm
ZXJlbnRseSBkZXBlbmRpbmcgb24gClBNIGluICpzb21lKiBkZXNpZ25zLCBidXQgdGhhdCB3b3Vs
ZCBzdGlsbCBiZSB3YXkgYmV0dGVyIHRoYW4gUkRUSU1FIGZvciB0aGUgCnB1cnBvc2UuCgpBcyBm
YXIgYXMgYmVuY2htYXJraW5nIGlzIGNvbmNlcm5lZCAoX2V4Y2x1ZGluZ18gc3lzdGVtIHNlY3Vy
aXR5KSwgUkRUSU1FIApzZWVtcyB0byBoYXZlIGFsbCB0aGUgcHJvYmxlbXMgb2YgUkRDWUNMRSwg
YW5kIHRoZW4gc29tZSBtb3JlLCBubz8KCj4gVGhlIHBlcmYgc3lzY2FsbCBvdmVyaGVhZCBpcyBq
dXN0IG9uZSB0aW1lIHNldHVwIHRoaW5nIGR1cmluZyB0aGUKPiBzdGFydCBvZiB0aGUgYXBwbGlj
YXRpb24uCj4gRm9yIGNvdW50aW5nIHRoZSBjeWNsZXMgYmVmb3JlL2FmdGVyIGEgbG9vcCwgaXQg
c3RpbGwgcHJvdmlkZXMgYQo+IGRpcmVjdCBDU1IgYWNjZXNzIGluIHVzZXIgbW9kZS4KCkkgc3Vw
cG9zZSB0aGF0IHlvdSBhbGx1ZGUgdG8gbW1hcCgpIGhlcmU/IFRoZSAoZHVtYikgRkZtcGVnIGNv
ZGUgaXMgdXNpbmcgdGhlIAppb2N0bCgpIGludGVyZmFjZSB0aG91Z2gsIGJ1dCB0aGF0J3MganVz
dCBsYXppbmVzcy4KCi0tIArjg6zjg5/jg7vjg4fjg4st44Kv44O844Or44Oi44OzCmh0dHA6Ly93
d3cucmVtbGFiLm5ldC8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
