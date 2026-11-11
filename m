Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F326606A33F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ep/UANiI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ni7juo5/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1rCOHn2yoWm39ycP7qK2niFmSPkc1WDQJAdrs5ybPEA=; b=Ep/UANiIkWreqRupHFSLdab3gu
	0l7SLfbPEGVJ735xlVtNoaqj57mnuQnl7wHYn3nY5umBk2/5ZR8N2QDlL2621bB+lrLpZ3ZM3DhUK
	ssJhIv24lqwy4v+tQtgi1XVAtG6atdfse1QMxl4zJIiD/LDN9xktjKgsx7rIUita+nrig4yC8Dfwq
	mfsR0m9w1ltmgfCzKL0tQBrQruXafnaeSQnY53EMzKPLAti51ixD6/wuifFgzn2YN+c0V/Nz0UN9C
	4Okt/URlbXijQMRS5SsJ2dbm0S/ocAXyz+xPcSBHbjqDHPOBmkXDUnIUgEHcbwpllW2iMti+mw5Nl
	Re88Mr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzuv-00000005bzq-2tv0;
	Wed, 11 Nov 2026 04:26:37 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzut-00000005bz9-1has
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 04:26:36 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-36fe5944e9aso2780515eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371194; x=1794975994; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=Ni7juo5/y3YFEXZYSbpVpCJ5V0VHzYSjr9MmBpJSXKTY39LRIXSBtqTMTBHOJTIfTy
         soVQOHkLpKHWnTYUws+y2QFtD06gR+KVEa/RvYR88M3mct8NUOVUClS2qAe2RUFVZLqt
         nNof3gLN+S3afx0pKkkVesf7W+gNEjBz07A6zn+FyFQF+rfE0cR1HwbMpek5dSA2aTLm
         xJFSzokqmuLiSfmHwWxgYHmPPzIy8Ua9w0mPJR4xyH7yOqshAVX1EPaU5LeEltVxAlUw
         bRMH2imoZS2pTrqqGWr0gG3fqHVQbMrYeaDsP2iTa2VwWEa+MjulqGDdS8PFcj5QDgPG
         s5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371194; x=1794975994;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkuS+mUk2RH2MSK3tXztbBdwGQB9HnQXtlhnX94SlQA=;
        b=eoYpEDm7IfOVVlTjDQ0w4PlAxLuz1kELrPLC2nUHYZu0wFXbgUv1jtINatEaRwH+Fb
         NNPoUoMprlRg7HubtK8w8uLDbgAblXInZ3CIwHeXFTT+418pOBaJiJEsu1F9P/06+0E5
         GpCx3Edtd/0jmA20q3swHr+TvzxQHkWq8GoHYuPoFuKeCpMoZ2zB6yXi5BpJ/iuk7GOn
         XVCu9icIoYf0rdXzOUgus6AlTou2po3KYyAiE+JrDt37EgdB3sr91RGwYwTHe7U8dF/r
         z/kAxipHySHdzWukAeHnCukqKdBWw+xHNGkzmvKcAJk5h+XsoEen/ejMs3DSRRdE6wFB
         lGtA==
X-Forwarded-Encrypted: i=1; AL+hErGqUVUCRvIjKf+vFYfbIdU7JNU/JvgM0sllgOTaFyKoEU9bKWU6PaZa3Xs3Cm4PPGXIYUuuSr/M/zgL/A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9C6+VK+ci6L1xKYaFdc2m8dc0G1fR4dQmeBWSr7fjXULNpzWNW
	W5rj4nlZZFWYa08hVdNXty8RuDzIcH1rwC5iiiUUdLx67vJwu9/2BGtM
X-Gm-Gg: AYBFou33ka/OWIgOI6fiekPrJQxpIbfUnqef3m3TKKaMWSTri6toUX+Kw8SIte3oP04
	RMIMRP0TA9EcnrXcQ2WPMszWWgtih9CeyWHg26uLYCMpO3YbMwf/zXgEKP6XGvpI5Nj1YlLBLIE
	5Ka3ZG3DZmhygyXBJ0FhAsNwzlsVhe7+ThjyADzHwLzLzYeSi6KIqM8ey6RZc/MVuxnSSg52351
	VyJGcoAj4rPcveK/trCYK0euWqGpkt+l3ZgGT61jIdCqxo5H+6fMiaesYi3DVCBlo7jxTddz/7L
	iOatb5L8OCOA3xn3eEIdCMc672hPw799FAhMtGFELfTjltRDFjlAAong7OmZxwiMJqeKb/yVTnE
	eHq1IB0mz1x5jSEt/qNd+B6m8jcC4nRgDoc09wm5EIQ3XdvGdMU65zP2EesCZRtNTMbaSSsBBc/
	6deD+0I3PIvlMMaJHcPD61824ZEuMfbfe0PWpYRwWBtPwgMVLF6gxPqfckEM6Cp3zhzrYmsIf0C
	wdJHvEsj3U3u6bIkfCK63JvVtKGBxsZeot08lK2whHT/nC0qph/k7rA4S1LeirD4BGUSkmGRJuy
	et4=
X-Received: by 2002:a05:7300:c382:b0:376:bcc4:774b with SMTP id 5a478bee46e88-376bcc479abmr1028837eec.23.1794371193980;
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm13018714eec.17.2026.11.10.20.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:33 -0800 (PST)
Date: Wed, 11 Nov 2026 12:26:28 +0800
Message-ID: <0d340a99e07dfba7ea1fba6d9529a1a6.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to
 the PHY PLL
In-Reply-To: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
 <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_202635_452084_2F7D226A 
X-CRM114-Status: GOOD (  23.21  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmVyb21lLAoKT24gRnJpLCAyNSBTZXAgMjAyNiAxNjo0Mzo0NiArMDIwMCwgSmVyb21lIEJy
dW5ldCB3cm90ZToKPiBPbiBkaW0uIDA5IGFvw7t0IDIwMjYgYXQgMjE6MTQsIENvZHkgS2FuZyA8
Y29keWthbmcuaGtAZ21haWwuY29tPiB3cm90ZToKWy4uLl0KPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNsa19wYXJlbnRfZGF0YSBlZHAwX3BjbGtfcGFyZW50c1tdID0gewo+ID4gIAlDQ1VfUEFS
RU5UX0hXKGxjZF9weGNsayksCj4gPiAtCUNDVV9QQVJFTlRfTkFNRShleHRlcm5hbF9jbGspLAo+
ID4gKwlDQ1VfUEFSRU5UX05BTUUoZWRwMF9wbGxfcHhjbGspLAo+Cj4gaGlkZGVuIGJlaGluZCB0
aGlzIG1hY3JvIGlzIGEgLmZ3X25hbWUuIEJhc2ljYWxseSB0aGVzZSBhcmUgeW91ciBEVAo+IGlu
cHV0IG5hbWVzLiBZb3UgY2FuJ3QgY2hhbmdlIHRoZW0gYXQgd2lsbCBsaWtlIHRoYXQgYmVjYXVz
ZSB5b3VyCj4gYmluZGluZ3MgYXJlIHN1cHBvc2VkIHRvIGJlIHN0YWJsZS4KClRoYW5rcyBmb3Ig
dGhlIHJldmlldy4KCj4gWW91IHNob3VsZCBub3QgdXNlIHBsYWNlaG9sZGVyIG5hbWUsIGV2ZXIu
IE5vIG5lZWQgdG8gbWFrZSB0aGUKPiBuYW1lIHRvbyBzcGVjaWZpYyBlaXRoZXIsIGZyb20gdGhl
IGJlZ2lubmluZyBpdCBzaG91bGQgaGF2ZSBiZWVuCj4gc29tZXRoaW5nIGxpa2UgInBpeGVsX3Bs
bCIgb3Igd2hhdGV2ZXIgeW91ciBkb2MgcmVmZXIgaXQgd2l0aC4KCkFncmVlZC4gVGhlIG5ldyBu
YW1lcyBmb2xsb3cgdGhlIGRvY3VtZW50YXRpb246IHRoZSBLMyB1c2VyIG1hbnVhbApkZXNjcmli
ZXMgdGhlc2UgdHdvIG11eCBpbnB1dHMgYXMgInBpeGNsayBmcm9tIGVEUDAgUExMIiBhbmQgInBp
eGNsawpmcm9tIGVEUDEgUExMIiAoUE1VX0xDRF9FRFBfQ1RSTCwgZmllbGRzIEVEUDBfUElYQ0xL
X1NFTCBhbmQKRURQMV9QSVhDTEtfU0VMKS4KCj4gImV4dGVybmFsX2NsayIgaXMgbm90IGRlY2xh
cmVkIGluIHlvdXIgYmluZGluZ3MgQUZBSUNULCBzbyBhdCBsZWFzdCBpdAo+IHNob3VsZCBiZSBm
aW5lIHRvIHJlbW92ZSBpdC4KClJpZ2h0LiBJdCBpcyBpbiBubyBiaW5kaW5nIGFuZCBubyBkZXZp
Y2UgdHJlZSBpbiB0aGUgdHJlZSBzdXBwbGllcyBpdCwKc28gbm90aGluZyB0aGF0IGZvbGxvd3Mg
dGhlIGJpbmRpbmdzIGNoYW5nZXMuCgo+IFRoZXJlIG5lZWQgdG8gYmUgYSBkdC1iaW5kaW5nIHBh
dGNoIGRvY3VtZW50aW5nIHRoZSBuZXcgbmFtZSB5b3UgbmVlZAo+IGFuZCB0aGVuIHlvdSBjYW4g
c3RhcnQgdXNpbmcgaXQgaW4gdGhlIGRyaXZlci4KClBhdGNoIDA0IG9mIHRoaXMgc2VyaWVzIGlz
IHRoYXQgcGF0Y2ggKCJkdC1iaW5kaW5nczogc29jOiBzcGFjZW1pdDoKYWxsb3cgZURQL0RQIFBI
WSBQTEwgcGl4ZWwgY2xvY2tzIG9uIEszIEFQTVUiKS4gSXQgY29tZXMgYmVmb3JlIHRoaXMgb25l
LgoKSSB3aWxsIGNoYW5nZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdjMgdG8gYmV0dGVyIGFsaWdu
IHdpdGggdGhlIGxvZ2ljIHlvdQpkZXNjcmliZWQuCgo+IEluIHRoZSBmdXR1cmUsIHBsZWFzZSB0
cnkgdG8gZG9jdW1lbnQgYWxsIHRoZSBpbnB1dHMgb2YgeW91ciBjb250cm9sbGVyCj4gaW4gdGhl
IGJpbmRpbmdzLiBFdmVuIGlmIHlvdSBkbyBub3QgdXNlIHRoZW0geWV0LCB0aGV5IGV4aXN0LgoK
TXkgcmVhZCBpcyB0aGF0IGNvbW1lbnQgaXMgbW9yZSB0byB0aGUgb3JpZ2luYWwgY29tbWl0IHdo
ZXJlICdleHRlcm5hbF9jbGsnCmJlaW5nIGNvbW1pdGVkLCB3aGljaCBpcyBub3QgZnJvbSBtZS4g
QnV0IHllcywgSSBhZ3JlZSB3aXRoIHlvdS4KCkNvZHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
