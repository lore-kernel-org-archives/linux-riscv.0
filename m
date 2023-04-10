Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F66C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWjkcbFGPyUwS6Gq66p6QmelQ3wj3/UdTjDmoP2bWHk=; b=WzE9IDXQLZ+m1M
	u9hSRb2mW4U32xm4K51lBgUO2TXAfd5PGQaj/d9bnH3NObQbELB+K9JoavqHL1IZt7rqH6rVe9bd8
	gewzstERNLTMSPfsvJkPkMIoQzCozaTL5T/GdX8CXp58M/4pEoH6XezVqXHAUCiwl+GEpCUfxR32w
	7LIcSdYwiKmqFayXcqwxAh8CAyTcJ9A8W7zncXidFMDmYBNc6PQo7S3ZQRTRnNRuqUcqfEckZncH9
	w/hhA2RUFHJLTXUM4rnzCZ1QCCAO/WETDjvx+KUna2chPEDtyiyaPW7W/seRi0N1DXq3RYAg0/0vh
	ELRAr0Ps+T0gEmFu8+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plo2T-00Etut-2e;
	Mon, 10 Apr 2023 09:42:17 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plo2Q-00Etts-3B
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 09:42:16 +0000
Received: by mail-lj1-x231.google.com with SMTP id n22so2916877ljq.8
        for <linux-riscv@lists.infradead.org>; Mon, 10 Apr 2023 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681119728; x=1683711728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6HIMp5HPIYwzx39Zs3ERp+4XjFzUpn9IkIJmmm8N5g=;
        b=kTa1s8ObzL4x/scAUIpJ5lnCr3TBiHpj8kYi+LxKtdJi5MlPMYRV6fk5+XFsisYuWQ
         e3lDPNPGSxDtqEUomY77DWJNbyyehG8TRP4t3CvYblUwhNDnir8+TYvPQMS5FqEYxHdX
         h6cv75u9H4BEiGWMghObNIFHErPcWHQUfScn8nvb8BddTfqxAM8A8ZE0ghYNsC+dcc/3
         TH2hXdVb6vN5/jKkI6FbZgdole8hP+pslpBmxYs9DzrnkiijnPrc1AC22/x9uuXZwNAj
         wHzZTzxxg4rGn3KKH8UGweCQ1lnVu5TTp5WsjPwrqJdQvYqk+lrWFVdZSHJDRUGWhOTy
         noUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119728; x=1683711728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6HIMp5HPIYwzx39Zs3ERp+4XjFzUpn9IkIJmmm8N5g=;
        b=6KsfDqErCytM/rcaehsacjrdAP0Vp+Dh/X2BUFtN4vosFuaFGj5Ei80T3TIKTx1glA
         i2Yeq4BwkxOzS02U++N2ji8ZN3SaTz4G1adMLPzNBoYO0uPxgwwr1po7oTvrfr/Wrard
         TSkrEimLTmNKyepVBcdVL1fpNcLlI1wPfKmwxDMG95lqkK2/i953NAG/oUy4rId4kGQK
         JbcbbfWP2BsIELAJOeS0uhTnpUIGY087FVz4gATu5yksXflskbJ/IELeglu58PPJgnCE
         dRVV6S4KBX6qc1wQbttcgex1yhDggwpbHYOi4CU/X7q6w6x7WQfcMnLrr+LBMjWfl89W
         cJnQ==
X-Gm-Message-State: AAQBX9erBhbFquaFWiuzhviBUz3lFjAJh3Pn/DXtEx5kLzg7iYm3eySF
	YQG64FegDzZR6/Ys/hlwfC7SyMIXrzh3rZlH5q/Jag==
X-Google-Smtp-Source: AKy350bk6w46vlv6oRG+v+DFoajxTbsMMyTGBokCnqcMKDJJwxvpqJXqumF0482SPhELKGlTRrK5F53lVgP8PaGeCn8=
X-Received: by 2002:a2e:9f44:0:b0:2a6:18c0:2b3e with SMTP id
 v4-20020a2e9f44000000b002a618c02b3emr2659377ljk.0.1681119728564; Mon, 10 Apr
 2023 02:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230403065207.1070974-1-bjorn@kernel.org>
In-Reply-To: <20230403065207.1070974-1-bjorn@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 10 Apr 2023 17:41:57 +0800
Message-ID: <CABgGipVHV9C3QwsCkaU+ecTPqhdztn7EwWOr1Hc1ETqEWhhdxQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: Save a0 prior syscall_enter_from_user_mode()
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Conor Dooley <conor@kernel.org>, Yipeng Zou <zouyipeng@huawei.com>, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_024215_024608_2323E9F3 
X-CRM114-Status: GOOD (  10.39  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCAyOjU04oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Cj4KPiBUaGUgUklTQy1WIGNhbGxpbmcgY29udmVudGlvbiBwYXNzZXMgdGhlIGZpcnN0IGFy
Z3VtZW50LCBhbmQgdGhlCj4gcmV0dXJuIHZhbHVlIGluIHRoZSBhMCByZWdpc3Rlci4gRm9yIHRo
aXMgcmVhc29uLCB0aGUgYTAgcmVnaXN0ZXIKPiBuZWVkcyBzb21lIGV4dHJhIGNhcmU7IFdoZW4g
aGFuZGxpbmcgc3lzY2FsbHMsIHRoZSBhMCByZWdpc3RlciBpcwo+IHNhdmVkIGludG8gcmVncy0+
b3JpZ19hMCwgc28gYTAgY2FuIGJlIHByb3Blcmx5IHJlc3RvcmVkIGZvciwKPiBlLmcuIGludGVy
cnVwdGVkIHN5c2NhbGxzLgo+Cj4gVGhpcyBmdW5jdGlvbmFsaXR5IHdhcyBicm9rZW4gd2l0aCB0
aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBnZW5lcmljCj4gZW50cnkgcGF0Y2hlcy4gSGVyZSwgYTAg
d2FzIHNhdmVkIGludG8gb3JpZ19hMCBhZnRlciBjYWxsaW5nCj4gc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZSgpLCB3aGljaCBjYW4gY2hhbmdlIHJlZ3MtPmEwIGZvciBzb21lCj4gcGF0aHMs
IGluY29ycmVjdGx5IHJlc3RvcmluZyBhMC4KPgo+IFRoaXMgaXMgcmVzb2x2ZWQsIGJ5IHNhdmlu
ZyBhMCBwcmlvciBkb2luZyB0aGUKPiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgY2Fs
bC4KPgo+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjogZW50cnk6IENvbnZlcnQgdG8gZ2Vu
ZXJpYyBlbnRyeSIpCj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5l
ckB2cnVsbC5ldT4KPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2
cnVsbC5ldT4KPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+CgpUaGlzIGZpeCB3b3JrcyBmb3IgbWUsIHRoYW5rcyEKClRlc3RlZC1ieTogQW5keSBDaGl1
IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
