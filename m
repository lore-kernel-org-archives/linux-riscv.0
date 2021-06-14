Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3114C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 23:21:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C569610A0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 23:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C569610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWPhgJ1ZvKaSQ88Bs9gY3PCisPCbQiq8OYFZYXxSnqQ=; b=b7z9MnG1QeXeoT
	fbJRS4nv6UX25rOel/iK9NTlL8JprzosaxTrvUy3UWhJrSvBfKtgfYWWpbpYoVcuSzTBoSHYwIVlt
	v0CClRsXANfY9dVV/gEfhZpjUjBhUE6+wcmase5eyoS+F+2H8wzH4OrSqCDT2+1zjkh9Znii6m0+N
	8qonCHys/PX0qzEHIzPzilKwagsBlkO/kl8M12ZBsLb7q1/EXD3tYaaSaCZQZVTPoXESuXPNBsdtD
	cHp+FLmRs+Gj6bOG8GLX9Br4JTzFeZ+QxqAUV1mnoKLTtA4X9ysMahacUyhznY6co7iuWhG2zmXNN
	Q9VRZXwjj1r29dZB8Smw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsvtO-00GZQO-1L; Mon, 14 Jun 2021 23:21:18 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsvtK-00GZPf-UM
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 23:21:16 +0000
Received: by mail-ej1-f45.google.com with SMTP id ho18so19256237ejc.8
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 16:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Mjn4ljykZJX6wf5SsiiT1XVgNk3B8Z6jPKynaaT/71I=;
 b=hzO5Zl1qbTzMLDZdpx863XwsIxOXqNRrGYeGaEICyzz1TJZoZWKQ+DEmCfUXGQrvso
 2FGvqGOjpAWrjTH8F6B/9RwHnudRUDhFLxEj3xr+pjDnY1ptaW4cbhePdEnQLov8rcAo
 z0BxTy/x6AuvsVxQToiOXBM/Co3+jr0DevwDRnoNmqqkVSeWD+zehvnu7KtIazMTQKmk
 yPjFPS6PaJXDJ11Z40iNgEw1ZZxZYkRMYjnpWCgtDDJFILVSh15DjecqCAa6sMQy8wyh
 N+68lft6eDe+2rIoDkzBt8t9+QqiosW2b66losYTkqsj05Q2nupIXwFarpqjObY1Cr2N
 y7RA==
X-Gm-Message-State: AOAM5327YbPbT/JZCnfs/6D0gLZM/V2WhbAZ/3Qz/2gAUkwiETU2AZcA
 5+jQ9fjfzQ3H09onHPYn3eLHENrvcOs=
X-Google-Smtp-Source: ABdhPJyUmP/3hRcpGOQzPA/32Bp362+ANYKYRrh35FuBJdG3GgsfIbntCk0vm3fVrykLXRJM5SpXEg==
X-Received: by 2002:a17:906:26db:: with SMTP id
 u27mr17664140ejc.532.1623712873308; 
 Mon, 14 Jun 2021 16:21:13 -0700 (PDT)
Received: from localhost (net-37-119-128-179.cust.vodafonedsl.it.
 [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id y20sm4862456ejm.44.2021.06.14.16.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:21:12 -0700 (PDT)
Date: Tue, 15 Jun 2021 01:21:07 +0200
From: Matteo Croce <mcroce@linux.microsoft.com>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, kuba@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, drew@beagleboard.org, kernel@esmil.dk
Subject: Re: [PATCH net-next] stmmac: align RX buffers
Message-ID: <20210615012107.577ead86@linux.microsoft.com>
In-Reply-To: <20210614.125111.1519954686951337716.davem@davemloft.net>
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <20210614.125111.1519954686951337716.davem@davemloft.net>
Organization: Microsoft
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_162115_004024_55DC150A 
X-CRM114-Status: GOOD (  14.89  )
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

T24gTW9uLCAxNCBKdW4gMjAyMSAxMjo1MToxMSAtMDcwMCAoUERUKQpEYXZpZCBNaWxsZXIgPGRh
dmVtQGRhdmVtbG9mdC5uZXQ+IHdyb3RlOgoKPiAKPiBCdXQgdGhvaXMgbWVhbnMgdGhlIGV0aGVy
bmV0IGhlYWRlciB3aWxsIGJlIG1pc2FsaXVnbmVkIGFuZCB0aGlzIHdpbGwKPiBraWxsIHBlcmZv
cm1hbmNlIG9uIHNvbWUgY3B1cyBhcyBtaXNhbGlnbmVkIGFjY2Vzc2VkIGFyZSByZXNvbHZlZAo+
IHdpb3RoIGEgdHJhcCBoYW5kbGVyLgo+IAo+IEV2ZW4gb24gY3B1cyB0aGF0IGRvbid0IHRyYXAs
IHRoZSBhY2Nlc3Mgd2lsbCBiZSBzbG93ZXIuCj4gCj4gVGhhbmtzLgoKSXNuJ3QgdGhlIElQIGhl
YWRlciB3aGljaCBzaG91bGQgYmUgYWxpZ25lZCB0byBhdm9pZCBleHBlbnNpdmUgdHJhcHM/CkZy
b20gaW5jbHVkZS9saW51eC9za2J1ZmYuaDoKCsKgKiBTaW5jZSBhbiBldGhlcm5ldCBoZWFkZXIg
aXMgMTQgYnl0ZXMgbmV0d29yayBkcml2ZXJzIG9mdGVuIGVuZCB1cCB3aXRoCsKgKiB0aGUgSVAg
aGVhZGVyIGF0IGFuIHVuYWxpZ25lZCBvZmZzZXQuIFRoZSBJUCBoZWFkZXIgY2FuIGJlIGFsaWdu
ZWQgYnkKwqAqIHNoaWZ0aW5nIHRoZSBzdGFydCBvZiB0aGUgcGFja2V0IGJ5IDIgYnl0ZXMuIERy
aXZlcnMgc2hvdWxkIGRvIHRoaXMKwqAqIHdpdGg6CsKgKgrCoCogc2tiX3Jlc2VydmUoc2tiLCBO
RVRfSVBfQUxJR04pOwoKQnV0IHRoZSBwcm9ibGVtIGhlcmUgcmVhbGx5IGlzIG5vdCB0aGUgaGVh
ZGVyIGFsaWdubWVudCwgdGhlIHByb2JsZW0gaXMKdGhhdCB0aGUgcnggYnVmZmVyIGlzIGNvcGll
ZCBpbnRvIGFuIHNrYiwgYW5kIHRoZSB0d28gYnVmZmVycyBoYXZlCmRpZmZlcmVudCBhbGlnbm1l
bnRzLgpJZiBJIGFkZCB0aGlzIHByaW50LCBJIGdldCB0aGlzIGZvciBldmVyeSBwYWNrZXQ6Cgot
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCkBA
IC01NDYwLDYgKzU0NjAsOCBAQCBzdGF0aWMgaW50IHN0bW1hY19yeChzdHJ1Y3Qgc3RtbWFjX3By
aXYgKnByaXYsIGludCBsaW1pdCwgdTMyIHF1ZXVlKQorICAgICAgICAgICAgICAgcHJpbnRrKCJz
a2ItPmRhdGEgYWxpZ25tZW50OiAlbHVcbiIsICh1aW50cHRyX3Qpc2tiLT5kYXRhICYgNyk7Cisg
ICAgICAgICAgICAgICBwcmludGsoInhkcC5kYXRhIGFsaWdubWVudDogJWx1XG4iICwgKHVpbnRw
dHJfdCl4ZHAuZGF0YSAmIDcpOwogICAgICAgICAgICAgICAgc2tiX2NvcHlfdG9fbGluZWFyX2Rh
dGEoc2tiLCB4ZHAuZGF0YSwgYnVmMV9sZW4pOwoKWyAxMDYwLjk2Nzc2OF0gc2tiLT5kYXRhIGFs
aWdubWVudDogMgpbIDEwNjAuOTcxMTc0XSB4ZHAuZGF0YSBhbGlnbm1lbnQ6IDAKWyAxMDYxLjk2
NzU4OV0gc2tiLT5kYXRhIGFsaWdubWVudDogMgpbIDEwNjEuOTcwOTk0XSB4ZHAuZGF0YSBhbGln
bm1lbnQ6IDAKCkFuZCBtYW55IGFyY2hpdGVjdHVyZXMgZG8gYW4gb3B0aW1pemVkIG1lbWNweSB3
aGVuIHRoZSBsb3cgb3JkZXIgYml0cyBvZiB0aGUKdHdvIHBvaW50ZXJzIG1hdGNoLCB0byBuYW1l
IGEgZmV3OgoKYXJjaC9hbHBoYS9saWIvbWVtY3B5LmM6CgkvKiBJZiBib3RoIHNvdXJjZSBhbmQg
ZGVzdCBhcmUgd29yZCBhbGlnbmVkIGNvcHkgd29yZHMgKi8KCWlmICghKCh1bnNpZ25lZCBpbnQp
ZGVzdF93ICYgMykgJiYgISgodW5zaWduZWQgaW50KXNyY193ICYgMykpIHsKCmFyY2gveHRlbnNh
L2xpYi9tZW1jb3B5LlM6CgkvKgoJICogRGVzdGluYXRpb24gYW5kIHNvdXJjZSBhcmUgd29yZC1h
bGlnbmVkLCB1c2Ugd29yZCBjb3B5LgoJICovCgkjIGNvcHkgMTYgYnl0ZXMgcGVyIGl0ZXJhdGlv
biBmb3Igd29yZC1hbGlnbmVkIGRzdCBhbmQgd29yZC1hbGlnbmVkIHNyYwoKYXJjaC9vcGVucmlz
Yy9saWIvbWVtY3B5LmM6CgkvKiBJZiBib3RoIHNvdXJjZSBhbmQgZGVzdCBhcmUgd29yZCBhbGln
bmVkIGNvcHkgd29yZHMgKi8KCWlmICghKCh1bnNpZ25lZCBpbnQpZGVzdF93ICYgMykgJiYgISgo
dW5zaWduZWQgaW50KXNyY193ICYgMykpIHsKCkFuZCBzbyBvbi4gV2l0aCBteSBwYXRjaCBJICht
aXMpYWxpZ24gdGhlIHR3byBidWZmZXIgYXQgYW4gb2Zmc2V0IDIKKE5FVF9JUF9BTElHTikgc28g
dGhlIGRhdGEgY2FuIGJlIGNvcGllZCBmYXN0ZXI6CgpbICAgMTYuNjQ4NDg1XSBza2ItPmRhdGEg
YWxpZ25tZW50OiAyClsgICAxNi42NTE4OTRdIHhkcC5kYXRhIGFsaWdubWVudDogMgpbICAgMTYu
NzE0MjYwXSBza2ItPmRhdGEgYWxpZ25tZW50OiAyClsgICAxNi43MTc2ODhdIHhkcC5kYXRhIGFs
aWdubWVudDogMgoKRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/CgpSZWdhcmRzLAotLSAKcGVyIGFzcGVy
YSBhZCB1cHN0cmVhbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
