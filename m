Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FBCC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMdHXo7sOx5yrQvM/jewT61TIQrxgCN46DpQc/HD2MM=; b=rEBYLroApKsxKH
	Y4/SMuaqAIN8b17Vif+lxSJbAdqmd+AIax73pXhl96XHoHbKvrtkZ7IdNGrrpW4tZhvp1VYHHtei0
	kuETj1cf8n8JRHw8BSHL4tlEWZcUtMe3WO/0O0PpvOEI1wocifYx9pP9Om5nXg1m2TT7JDrY48fEh
	FZBVsFFU1xFVtb0cRX5BvI6yYlCf8moVfc4G2aX6FwGFapkrbRwp23+2KehGelyrfkSQYr+VCvpSq
	Gz+CqHVPRpqufwWlcFUfQbT3VaLZc04Zxaaxvl5KU0V7u7ZWtYWa0YO2DvMvN6KOY3rM0+ScxvOu0
	B2eHyMhm/jNHW2Oauraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q407O-00ECEr-2R;
	Tue, 30 May 2023 14:14:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q407M-00ECDO-0Z
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 14:14:33 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3b314b1d7so4793309e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685456069; x=1688048069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYxgvTgmLTiwEy0syweRb4z2Wkk8dETXQo0MhrTGxn0=;
        b=kIpkGI4ZNZ0nH7PFH1QiZ30yrckiIkIv8R03VbUtOObUkZp3udHzY7xRjqvUgLbzv4
         qvWEllpP4gpMZGoM5YECSa0GZDe1/Nb8Q6X2dZha5M9fnIl6oNrozACSqzBPCOV6mql+
         UjV/unhhcFii5eKQ8b5fmuozsqZlsfsHdDd7x723q5sbjPddY6/VLuC2DaXicdoIYftM
         ixY7eJgIDOPDIyDlZm2xvnpnOXqQcVo7kNp3ikI16CwfNzpH/XTDdJA9lLTLCFHnrks7
         hS28483dExR54SdyAzZExFXUIjC2QePnOliAuDeUM7aRuO3d8c86ru22t55YKklvk3Fx
         ePZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456069; x=1688048069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYxgvTgmLTiwEy0syweRb4z2Wkk8dETXQo0MhrTGxn0=;
        b=eBar89J1uMzs227r+UrdZBzIj+ZMdjD89Df+Ugt3mYddA383sBQX66P58fSCihEuWC
         QftdKsbDm4ixrhI/jBoi7m6zs8WpJEF+LKMVaavZkdbMRbeM+2bjkxWyphqLIxlnd/vW
         J5GuaQA++Gv6EI8g30cjCDIqgCjoyFs5uMDmaoWJWzqTLR1Oyhtw9+HjUjMTcoKJFcgC
         6aEUKeY5Z00tYK2vj+yVMSM2RCnFnMKcatXbHHSrjVf5UfFmDeZET444HIi7oSBgvvzf
         UEi9zZaiZsx3pxSybBpXuwMTYXlPgr4gwcm4QB4ZaSeSLY7dFqiWlGz3Vs+ujcyHRbM6
         zIQA==
X-Gm-Message-State: AC+VfDxFcqIu1gXWbo4DP4ZYZAtaHLLs/Q/+8xxdeG0xSsL3g3Ibg5kD
	bdSHJQnxlUddgyoDqqu2UFztj0bX5qk8OIkQd1v2ww==
X-Google-Smtp-Source: ACHHUZ6Jmb5YfXTJ5I8UNoc6cbVJCh5qVWnqBmBmC27letc2gcpGL0W5K38DbbyVU12c470hm9xSn1FBa9yZclZJE1E=
X-Received: by 2002:ac2:518f:0:b0:4f4:4cd4:2586 with SMTP id
 u15-20020ac2518f000000b004f44cd42586mr726914lfi.20.1685456069005; Tue, 30 May
 2023 07:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-52f8af07-f3fc-4674-94ea-abbe2108907a@palmer-ri-x1c9a>
 <20230524092530.7773-1-andy.chiu@sifive.com> <3656227.v5FYL8H6MN@basile.remlab.net>
In-Reply-To: <3656227.v5FYL8H6MN@basile.remlab.net>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 30 May 2023 22:14:16 +0800
Message-ID: <CABgGipUZL79faigrFpjeHVyyqZDFSdOL7fiEpJojZmg1f9-rCQ@mail.gmail.com>
Subject: Re: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace
 vector management
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_071432_241003_3C807822 
X-CRM114-Status: GOOD (  14.64  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMTI6MTbigK9BTSBSw6ltaSBEZW5pcy1Db3VybW9udCA8
cmVtaUByZW1sYWIubmV0PiB3cm90ZToKPgo+IExlIGtlc2tpdmlpa2tvbmEgMjQuIHRvdWtva3V1
dGEgMjAyMywgMTIuMjUuMzAgRUVTVCBBbmR5IENoaXUgYSDDqWNyaXQgOgo+ID4gSG93IGFib3V0
IGFkZGluZyB0aGUgZm9sbG93aW5nIDIgcGF0Y2hlcyB0byBkZWFsIHdpdGggdGhlIHByb2JsZW0u
Cj4gPiBIb3dldmVyLCBJIGFtIGNvbmNlcm5lZCBpZiB0aGlzIG1ha2VzIEVMRl9IV0NBUCB0b28g
Y29tcGxpY2F0ZWQuIGUuZy4KPiA+IEZ1dHVyZSBleHRlbnNpb25zIG1heSBhcyB3ZWxsIHdhbnQg
dG8gZG8gc29tZXRoaW5nIGhlcmUgYWZ0ZXIgd2UgY3JlYXRlCj4gPiBhbiBlbnRyeSBoZXJlLgo+
Cj4gRmluZSB3aXRoIG1lIGJ1dCBJIGZlZWwgdGhhdCB3ZSBhcmUgbWlzc2luZyB0aGUgYmlnZ2Vy
IHBpY3R1cmUgaGVyZSwgYXMgdG8KPiB3aGF0IHRoZSB1c2FnZSBwYXR0ZXJuL2d1aWRlbGluZSBm
b3IgdGhlIHByY3RsKCkgb24gdXNlcnNwYWNlIHNpZGUgc2hvdWxkIGJlPwoKWWVzLCBJIGFncmVl
IHRoZSB1c2Ugb2YgdGhpcyBwcmN0bCBpcyBvbmx5IG1lYW5pbmdmdWwgZm9yIHRoZSBpbml0CnN5
c3RlbSwgb3Igc29tZSBhbnNlbnN0b3IgcHJvY2Vzc2VzIHRoYXQgbWFrZSBwb2xpY3kgZGVjaXNp
b25zLiBBbmQKd2l0aCBFTEZfSFdDQVAgcmVmbGVjdGluZyBwZXItcHJvY2VzcydzIGF2YWlsYWJp
bGl0eSBvZiBWLCB3aGljaCBpcwpkZWNpZGVkIGJ5IGVpdGhlciB0aGUgcHJjdGwvc3lzY3RsLCBw
cm9ncmFtcy9saWJyYXJpZXMgZG8gbm90IHJlYWxseQpuZWVkIHRvIGNhbGwgdGhpcyBwcmN0bCB1
bmxlc3MgdGhleSBhcmUgZG9pbmcgYWZvcmVtZW50aW9uZWQgc3R1ZmZzLgoKSSBhbSBnb2luZyB0
byBkb2N1bWVudCB0aGVzZSB3aGVuIHJvbGxpbmcgb3V0IHRoZSBuZXh0IHJldmlzaW9uLgoKPgo+
IE1heWJlIGl0IHdhcyBhbHJlYWR5IGRpc2N1c3NlZCwgYW5kIEkganVzdCBtaXNzZWQgaXQsIGJ1
dCBJIGNvdWxkbid0IGZpbmQgaXQgaW4KPiB0aGUgZG9jdW1lbnRhdGlvbi4KCldlIGhhZCBkaXNj
dXNzZWQgdGhlIHBvdGVudGlhbCB0aGVvcmV0aWNhbCBhYmkgYnJlYWthZ2VbMV0sIGFuZCBjYW1l
Cm91dCB3aXRoIGEgbmVlZCBvZiBhIHByY3RsL3N5c2N0bCBpbnRlcmZhY2UgZm9yIGRpc3Rybydz
IGVhcmx5CnVzZXJzcGFjZSBwcm9ncmFtcy4KCj4KPiAtLQo+IFLDqW1pIERlbmlzLUNvdXJtb250
Cj4gaHR0cDovL3d3dy5yZW1sYWIubmV0Lwo+Cj4KPgoKWzFdOmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9taG5nLTQ3YWE5NjVhLTJiMjUtNGFjMC05ODRhLWMyZTZmM2EwNTFlZUBwYWxtZXIt
cmkteDFjOS8KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
