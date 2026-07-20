Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BFDC44529
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 20:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e1PMnfyckPDrz7Xjd6+d97dCWddAq1OpK92k2dTEFc=; b=f8eZZ9c1w15wsv
	jPKVbEoo7Ha3twcg4NbPH0c/qTDm7U0qQQm1l9HdfWmyv9FY0PvqL6BVEe/bjsBidSWyypPxRv6WR
	QrOvZC7dwghGMoQYnSEPRF5MdXUjPxSqlUR0J3u8VXrL0C7fe3o3Wt2y7cK/L4hzzlzaMO4wR0kvf
	t1XpBDFcJNbDSLs1dic48BkfyCWx654iLvfug7ZCi6vwqmeVGQxqdJmpezYl8BEO1ksgvjnR5g268
	4R4qZUrXPwfI0nMEXFuNEYQOzA7V629IrHR2bG4QVS9oyrRUFzT431P/6RlfXHYE07EiSPSI3qigG
	y7A9lMmoZzNPWwbDczCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluWA-00000007r63-2PNV;
	Mon, 20 Jul 2026 20:23:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluW8-00000007r54-1ipy
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 20:23:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso1309167966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 13:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784578990; cv=none;
        d=google.com; s=arc-20260327;
        b=jffbgJTVjj8TZVOEhupK5QVB3Rc7QglJ2W5mHX1a7V2PzHkT+nb2V6hAI6BPnbm0Z7
         5mws3NXuqAo/cCx4lqki6o1UMG5geVQCo1ew7uDvScSg+E+cDR8tJqkGLZ+x+HSS0aqY
         hgUHd8W+oN1etrJ+8XrNEsTwn483z0YmgfsrZreccXRL/z/JADnFVyaTt1CBiPqYaK50
         BoQmnrBK77sKXEFz8pCmCapp+ruiPDThg8iGhxAL521cN+KarMI2DipFL4FY4bPY7pqS
         n2FL52ssoOZyyGQmRvouHbWZ5YYHuTioUiyV2+engF37m+UjVFqoRtPkWQ6lMS/TeEvS
         /kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5p3cHtQtnS2cSmiUqe9etBZiOH35jMaML1hTW4v5So=;
        fh=YiOIkLVfut45/+4jwWGogEV80TV8j+wMwrBGgl1O+rQ=;
        b=Ku8Q+x2uxOG7wEOZuYkJtICuXJ3CZ/8x1VSfE026iWf8AHFmZkN1jpDRPpuKQENwLq
         wXZBa2QHKsI35B8+CEvm7ks25gW8Pzzz8iDgvw3Grl9Hba4qla9uxrPwgOBz/OYGwwuH
         PtpuIE+k229Eg8AR2CCWZDaWDwo1lUr+uyL0uF1k5OJUqYrjf4tXvVvNXHtb8vFMM+Dd
         /XjoE/fIJj43k6oBw/XhW8J9biCvpPM/58/W+xHnwAzFZ9hmcOBe1vn896PKuo9TUjSA
         XAzVwveNG8lWWgPS371frISE8iHzCvOlIpuMXq94IycP/BF4+4ixrcNnJ3zt+k55W60/
         nbbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784578990; x=1785183790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5p3cHtQtnS2cSmiUqe9etBZiOH35jMaML1hTW4v5So=;
        b=s/7qo58waCfdeH7XYNWyP/NfKkYNgegTju7PAVvOGoDQlytcW8UY6wLorial9wNTh1
         GvZ33pSrPXkNyOe5N19byXYYnzxK6flssBJ6j1KtOQx6v6rm7vGuf1TMWJxk9WYNIm5N
         Fd+Uay3jOkFhSxsC4az5IrCG+nXNbyP8EZqo4Odxbkp46FPSs4g0cnSDzT33IHRQEAcn
         +FBb4idCiAOq1cXRRKF9IIx7mPog607fTC9HII6owHUke7GuseNPpK/usT8CareRSr5R
         UJbwd/WLRMypfPVOqt139a7Xr+iDnT8CNaU+kljNxuNQu/RZFzrTrpKX+zLVsHyYW5TM
         cxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578990; x=1785183790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5p3cHtQtnS2cSmiUqe9etBZiOH35jMaML1hTW4v5So=;
        b=jGfny40gpp8ippLXhBkLNwRJ8lwaCHyyBfZiBSEWqTv01Sh0jT2kwMY8oMcZiv3AwK
         Kym0tQvyWEw9pg0ByNlq6O/1n9YCPRHB1ttNzwl1Jz/xcWSmnFr9yhCOUN+SjFU1FUnm
         QWxOQXFa5Pc8RN3uWhAamfCKal93Yt9Ir38FgWGUztdLQn598CyVM5VDiSY6Uu4vWDB0
         xwxTUQYE/O7jfqvOPX8WUE+Ll+Jw1gUwWMO9se4hKsCPvAKeHGDkH1Rj0KlXuR4f1sv1
         WcgTBR5Of9BTwlBeY4cEs8uMTflCWk2O9g6QxYnsnqE2I9IBRfgsikWIcpFc1uFl1OVo
         5y1w==
X-Forwarded-Encrypted: i=1; AHgh+RqWaB4d9Bp1HExyua7hCvDxNbZk2AKkrgz+HolhHkM/l7ChLtPPdTJXqMgVPwHrppWLBRGMfqoFiz0ugw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn+rxLLqwF5vqkA2iPpPKAQ1v4cFlQ5KgL39LK8186hauMBjEv
	S8oPBArj+f5F8qAHS6v8/53iMprL/k969ADZ0we77Bh9U9RZkZw4KBoOjpF+52m9G5iL7dIXZDl
	mbCJ3gI9zwYib2zAJs6ylybT7STEjxy4=
X-Gm-Gg: AfdE7clcTtLX3fofjkMVwiH1xG+CmVLvakFNXjnTvMl2FihLjMQbmoBhALlUZeF98y7
	MgmwplbSOEbjsT2Wb1naIPvlkpCIb4Qd3ICeL94WCsn5XQu2Ex9X9AqtzXp/sm71S/8NOxmPLIk
	2cIxpeAfpG3AB7y6s8ye06m6JksgmlaN+d7aUNfaU0J6lGKdGIAFOzmWHc8JppWxEBOMYn4NPRV
	EezGgDmM7mfRmc5tC2ibiiFjQ2O6lano+Vivr0dkROAABas+hEyxcJ6/nDDiXNqfWv5BSXGtlrX
	nUkhmSypibVKULGEze3l4tPQiuJUsg/HgDGMFLqnTKFntRpgxSV9iPaq7Li18oteE61KmFl2JS3
	cEhZea9Debeni5GfFvKu+ma3Jgfo99vTRFRwZpcRnvW9XTDc=
X-Received: by 2002:a17:907:3e18:b0:c16:82cb:36c with SMTP id
 a640c23a62f3a-c16b4878388mr701703066b.65.1784578989603; Mon, 20 Jul 2026
 13:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260522101042.21976-1-fushuai.wang@linux.dev> <dnpnqx6fz4osobhi7ydt2pi6hvqb4lm5vonpfpwrl2nogpadmw@6bqiyjskjo5j>
In-Reply-To: <dnpnqx6fz4osobhi7ydt2pi6hvqb4lm5vonpfpwrl2nogpadmw@6bqiyjskjo5j>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Jul 2026 23:22:32 +0300
X-Gm-Features: AUfX_mxtOFcF-lXO1FmKE2L6YVCWQGBhiXFoukdSxDl7f7nq0E5VpURnHlR6Z0Q
Message-ID: <CAHp75VcTs2Vro3vg8dqmYfRebk6bBfmJCZFBgD2KMHpTKY6jvQ@mail.gmail.com>
Subject: Re: [PATCH v3] serial: 8250: Clear CON_PRINTBUFFER on port re-registration
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Fushuai Wang <fushuai.wang@linux.dev>, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, ilpo.jarvinen@linux.intel.com, 
	osama.abdelkader@gmail.com, jackzxcui1989@163.com, kees@kernel.org, 
	sean@mess.org, alan@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, wangfushuai@baidu.com, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_132312_485674_EA527045 
X-CRM114-Status: GOOD (  14.98  )
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMTA6MjLigK9QTSBBbmlydWRoIFNyaW5pdmFzYW4KPGFz
cmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgTWF5IDIyLCAy
MDI2IGF0IDA2OjEwOjQyUE0gKzA4MDAsIEZ1c2h1YWkgV2FuZyB3cm90ZToKCj4gU2VlbXMgbGlr
ZSB0aGlzIHBhdGNoIHdhcyBhZGRlZCBpbiBuZXh0LTIwMjYxNzE3LgoKMDcxNwoKPiBJJ20gbm90
aWNpbmcgdGhhdCB0aGlzIHBhdGNoIGlzIGNhdXNpbmcgbm8gc2VyaWFsIG91dHB1dCB0byBiZSB2
aXNpYmxlCj4gb24gcmlzY3YgYm9hcmRzIHRpbGwgdGhlIHVhcnQgZGV2aWNlIGlzIHJlZ2lzdGVy
ZWQuIE5vcm1hbGx5IHdoaWxlCj4gYm9vdGluZywgd2UgZXhwZWN0IGZvciBhbGwgdGhlIHByaW50
cyBtYWRlIGJlZm9yZSB0aGlzIHRvIGJlCj4gYnVmZmVyZWQgYW5kIGFwcGVhciBwb3N0IHNlcmlh
bCBkZXZpY2UgaW5pdGlhbGl6YXRpb24uCj4KPiA9PiBib290aSAweDExMDAwMDAwIDB4MjEwMDAw
MDA6JHtpbml0cmRfc2l6ZX0gMHgzMTAwMDAwMAo+IE1vdmluZyBJbWFnZSBmcm9tIDB4MTEwMDAw
MDAgdG8gMHgyMDAwMDAsIGVuZD0xY2E2MDAwCj4gWyAxNjEuMzAxXSAjIyBGbGF0dGVuZWQgRGV2
aWNlIFRyZWUgYmxvYiBhdCAzMTAwMDAwMAo+IFsgMTYxLjMwMl0gICAgQm9vdGluZyB1c2luZyB0
aGUgZmR0IGJsb2IgYXQgMHgzMTAwMDAwMAo+IFsgMTYxLjMwN10gICAgTG9hZGluZyBSYW1kaXNr
IHRvIDc2NTNlMDAwLCBlbmQgN2RkODE4NTMgLi4uIE9LCj4gWyAxNjEuMzY2XSAgICBMb2FkaW5n
IERldmljZSBUcmVlIHRvIDAwMDAwMDAwNzY1MzIwMDAsIGVuZCAwMDAwMDAwMDc2NTNkMjVkIC4u
LiBPSwo+Cj4gU3RhcnRpbmcga2VybmVsIC4uLgo+Cj4gWyAgICAwLjIzNTE1OV0gcHJpbnRrOiBs
ZWdhY3kgY29uc29sZSBbdHR5UzBdIGVuYWJsZWQKPiBbICAgIDAuMjM4Nzg3XSAvc29jL2kyY0Bk
NDAxZDgwMC9wbWljQDQxOiBGaXhlZCBkZXBlbmRlbmN5IGN5Y2xlKHMpIHdpdGggL3NvYy9pMmNA
ZDQwMWQ4MDAvcG1pY0A0MS9yZWd1bGF0b3JzL2J1Y2s1Cj4KPiBNb3N0IGRldnMgd2hvIGFyZSBk
ZWJ1Z2dpbmcgbWlnaHQgYmUgYm9vdGluZyB3aXRoIHRoZSBlYXJseWNvbiBib290Cj4gcGFyYW1l
dGVyLiBJZiBlYXJseWNvbiBpcyBwcmVzZW50LCBzZXJpYWwgb3V0cHV0IGlzIHByZXNlbnQsIGJ1
dAo+IHdpdGggZWFybHljb24gbWlzc2luZyAod2hpY2ggaXMgd2hhdCBtb3N0IGRpc3Ryb3MgdXNl
KSwgSSBkb24ndCBnZXQKPiBhbnkgc2VyaWFsIG91dHB1dCB0aWxsIHRoaXMgcG9pbnQuCgpQZXJo
YXBzIGl0J3MgaW5jb252ZW5pZW50LiBMb2dpY2FsbHkgSSBzdXBwb3J0IHVzaW5nIGVhcmx5Y29u
IChJIGhhdmUKbm90aWNlZCBhIGZldyB0aW1lcyBpbiB0aGUgcGFzdCBkb3VibGUgcHJpbnRpbmcg
b2YgdGhlIGtlcm5lbCBidWZmZXIKdG8gdGhlIHNlcmlhbCBjb25zb2xlKS4gU28gSSB0ZW5kIG1v
cmUgdG93YXJkcyB0aGF0IHRoaXMgcGF0Y2gKYWN0dWFsbHkgZ2l2ZXMgYSBiZXR0ZXIgZXhwZXJp
ZW5jZS4gSG93ZXZlciwgSSBoYXZlbid0IGdpdmVuIGFueSB0YWcKdG8gaXQsIG5vciBkbyBJIG9i
amVjdCB0byBhbnkgaW1wcm92ZW1lbnRzIG9yIHJldmVydGluZyB0byB0aGUgb2xkCmJlaGF2aW91
ciDigJQgeW91ciBpbmNvbnZlbmllbmNlIHdpbGwgYmVjb21lIG1pbmUgOi0pCgpKdXN0IG15IDJj
LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
