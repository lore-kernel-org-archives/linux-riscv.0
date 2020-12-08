Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4696EC4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 12:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D500323AAA
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 12:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D500323AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lLre2HRLqIjH2qZSxP9HPjLBA5Nfd0H41tSuf2yY/BE=; b=Aez7GhKW2/d+v85iwo0g05jgP
	glTwJVvlNRNNZbcRbN+gEP+O3ffmMXmne5elJ8ZoyoY9cw4oxNQ03ckx2/dETVA25Ud/49ZpZW7E1
	cACDmXV480FoEZRG3JBWunJ1BvPK57T7WHctUvCVTH9x81I6xfakyt9tj/Wdm9Kgqi+JcUF++PWAG
	eLlCRQxP7ptUs9kf8uwqEsipstpQ5LAL5C2/M1jur7VfZ9qGkJnMtGa0kEMRBYMdcDndYzmavs/JF
	0a8O6uhFpLx94wIxktxb4CyHtZSoBFshDD0pKmEPuV/DDnmKA5Ma2WUFYyQXjfWtB3msYK531Kmit
	Bt6/z/kpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmcBF-0005h5-EZ; Tue, 08 Dec 2020 12:33:21 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmcBC-0005gk-IQ
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 12:33:19 +0000
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M3lLh-1klmxl43L1-000rf6; Tue, 08 Dec 2020 13:33:07 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <20201208101051.GC6564@kitsune.suse.cz>
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <dcc41cf3-ab2d-656e-6fa3-73f231bde92d@metux.net>
Date: Tue, 8 Dec 2020 13:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201208101051.GC6564@kitsune.suse.cz>
Content-Language: tl
X-Provags-ID: V03:K1:2gJtNh4al/jz5b6j0FWhYwrU96FWym4vYQii+IyxLA7dtvUfT6j
 aQ4QBpU8JKJUL26agzv4pu018C1ng9f3M/AaUOcypeeHDUDtvyKGkULf/R5tbPsfR3K41I5
 r1M0Bx3FdsPt3POi5zVzjVgX/sNWG0gBfiseEyjQN+2EroOr7tbPfz+AQxm5JNdlyVDVXnh
 KV7FYMCR+TLF4s8ZuE38g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ndMilS7teO8=:/uZ20rDlYDqOeFHndpr1cb
 AOgzroYYCjupeD6v9mWfnDJfZJjekpD+ZJIEFRpbhAYgk2/n5JgOmO7ch70CwGQ1dUbRSYmeB
 xT+THBee8CP5JD1InY8vmmIah4HlcP81FeIzh4jJJUPlvxypSPkVRMSzRVkySQA6YjsibsIhU
 FW2eXlWtif2BgwZpTeBzCSwfXSkQRn17817gHXqeH2YhGat+GE0MT1LWbBFu64U4MI/1NN6nq
 twC12fYfafB5T1j7D7JFuJqGR1LrRBjFVPB33rukvUxNNqeol2FZRLIgDta0Zrqa6QuTa40GM
 Cy/cBD+UuuROzUY5cjEpGc56poFDtVwIb+g+kkIoTzWK+etFCgrgu8HCdSoaclVZCpOjOGRKe
 BZM8uMCGhYkLWzKLhAbsD1vNrx6VfleGkkfnDFCeCQ0fO285UQkCSKkqSkP1s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_073318_828008_41EEDE46 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: stefanha@redhat.com, corbet@lwn.net, Jason Wang <jasowang@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linus.walleij@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDguMTIuMjAgMTE6MTAsIE1pY2hhbCBTdWNow6FuZWsgd3JvdGU6CgpIaSwKCj4gVGhlIGNv
bnNvbGUgZHJpdmVyIHByb3ZpZGVzIGVhcmx5IGNvbnNvbGUgd2hpY2ggc2hvdWxkIGluaXRpYWxp
emUKPiB3aXRob3V0IGFueSB0cmFuc3BvcnQuIEkgaGF2ZSBub3QgdGVzdGVkIGl0IGFjdHVhbGx5
IHdvcmtzIGJ1dCB0aGUgY29kZQo+IHNlZW1zIHRvIGJlIHRoZXJlIHRvIHN1cHBvcnQgdGhpcyB1
c2UgY2FzZS4KCldoYXQgZG9lcyBpdCBkbyBpZiBpdCBoYXNuJ3QgZ290IGFueSB0cmFuc3BvcnQg
eWV0ID8KCkp1c3QgZWF0IHRoZSBiaXRzIG9yIGJ1ZmZlciBldmVyeXRoaW5nLCB1bnRpbCBpdCBn
ZXRzIGEgdHJhbnNwb3J0cG9ydAphbmQgc2VuZHMgb3V0IGxhdGVyID8KCi0tbXR4CgotLSAKLS0t
CkhpbndlaXM6IHVudmVyc2NobMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJnZWjD
tnJ0IHVuZCBtYW5pcHVsaWVydAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hlIEtvbW11
bmlrYXRpb24gc2VuZGVuIFNpZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwgenUuCi0t
LQpFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFuZCBMaW51
eCBlbWJlZGRlZCBlbmdpbmVlcmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
