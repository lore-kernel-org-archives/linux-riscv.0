Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55A4C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 11:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7OrZNZ4dZ6jcqUUiVsupwMuS0KkqokvLmR99z9Ajjg=; b=xba5lK9lOAWVpb
	cgHhh9vwSfEbit7zEO6pzB6Jd4eDL1QySEqwvBWBniXEVdg4bTKBt9HvPWxHMYAdjR+xFhk42gb7e
	FLaGGZlXPb9BzfXuA50+5QZkvSMpXT8s9UrTySuLzV+hLvOhEdbCc/X93f95BOYOqqJKupF5523ew
	dLRjzkAWnsyBu81HhUrEKJVcYqmnyXjqnKljqi55/uPXp2ZivYTNO0WEaD+ea9gzqpd88XNlAo29C
	G27NWHQmJL5AX3jh0DAk0ZNvmEkHCmneTyKqK/WKuX1d9iQcQW5ZH1ggsH6R6J/znrxpY2SCNEsB2
	6e9hb4FPNg2v4Dflvjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0Gj-00AhWl-Vr; Thu, 26 Jan 2023 11:18:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL0Gg-00AhVL-Mf
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 11:18:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q8so885038wmo.5
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+3TvO79F7TEEj/cEI0PvElkjPOY6Ohmc660NweZRSU=;
        b=lkx9WMVEmqzIyivtlhzZ0ulR60zs1TzOH1UzIs5UvcAsoVJvATwYBchdRTOW8gGpba
         37W9viahXGpoZgEsxcsjp27xoRClpBDJhVrjCIvjVSlYNJ11TQHQWt2cyM749Iu5357C
         HVxLlWH6MFWlHAAY4dk4e/xNcyha5CuIDkUXEd73ZkFDXl9OpmXPRh6HSND10ZTaE6HF
         gYLgEPMyUPVXEMx/Aspl7xaEY1hni9l+vGrB/ZjR/sRTtJd07NFxxdJwVfVVZWxyWNtg
         j6beKYNQ8456Mw8Xqm58DedlTyFEPSvhKQvhtQgcW+rf+pJPWLKAoZqvuPdpog2K+y6Q
         jvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+3TvO79F7TEEj/cEI0PvElkjPOY6Ohmc660NweZRSU=;
        b=LXDXXDeeCIoeyL6n8SFtk5nhlhOI2xREw6CK6FHD/8FXUGb/d6tBCxRvR4XkLS2oSh
         hPPwPNYrJz24G9KO+TUTPoS/wz0EXlT9g8GNReHB4fU6AzAMAx8LetpRm0IBFiWhun4c
         6FYepCQHJZHe3eXxWIvcjv6KTgEvuaLL9uXqQc7N7OhS0A+FSFzP9ykdXt696Oo1M2r9
         XtkBRmspETV6CHMYRgJC+3LAU4IZDINCvPkKEQNF/C8jHzpd5Z7t4rQZoTvXEt9re32/
         jgkRhVcH0TsDVH4RDWPFKfTFRWvC6fMRhzYmLhUqT42076Fb+n9dYPi4mAURMYhJLSvo
         q88g==
X-Gm-Message-State: AFqh2kpXHaPO2DPKKHhyisbwhH+f+fjbuLaw2MnRofuVgycyJChk8VGc
	K/DYli4YoB6giuL3TUkNthhiMQ==
X-Google-Smtp-Source: AMrXdXsjZN+5SOjisx2Bn0IQCFbL29bvC6rFJ4l0C6wRDdFAmemSF4Qcvr4XjxpJ5Gm5bqy3xnmyqA==
X-Received: by 2002:a05:600c:281:b0:3da:1132:4b63 with SMTP id 1-20020a05600c028100b003da11324b63mr35350886wmk.5.1674731887928;
        Thu, 26 Jan 2023 03:18:07 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id z3-20020a05600c078300b003db12112fcfsm1160901wmo.4.2023.01.26.03.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 03:18:07 -0800 (PST)
Message-ID: <b766f862-b253-b2a7-7f43-87ebeb0a4263@linaro.org>
Date: Thu, 26 Jan 2023 12:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] clocksource/drivers/riscv: Get rid of
 clocksource_arch_init() callback
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Samuel Holland <samuel@sholland.org>
References: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_031810_793166_30E08F79 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjkvMTIvMjAyMiAyMzo0NiwgUHJhYmhha2FyIHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiAKPiBIYXZpbmcg
YSBjbG9ja3NvdXJjZV9hcmNoX2luaXQoKSBjYWxsYmFjayBhbHdheXMgc2V0cyB2ZHNvX2Nsb2Nr
X21vZGUgdG8KPiBWRFNPX0NMT0NLTU9ERV9BUkNIVElNRVIgaWYgR0VORVJJQ19HRVRUSU1FT0ZE
QVkgaXMgZW5hYmxlZCwgdGhpcyBpcwo+IHJlcXVpcmVkIGZvciB0aGUgcmlzY3YtdGltZXIuCj4g
Cj4gVGhpcyB3b3JrcyBmb3IgcGxhdGZvcm1zIHdoZXJlIGp1c3QgcmlzY3YtdGltZXIgY2xvY2tz
b3VyY2UgaXMgcHJlc2VudC4KPiBPbiBwbGF0Zm9ybXMgd2hlcmUgb3RoZXIgY2xvY2sgc291cmNl
cyBhcmUgYXZhaWxhYmxlIHdlIHdhbnQgdGhlbSB0bwo+IHJlZ2lzdGVyIHdpdGggdmRzb19jbG9j
a19tb2RlIHNldCB0byBWRFNPX0NMT0NLTU9ERV9OT05FLgo+IAo+IE9uIHRoZSBSZW5lc2FzIFJa
L0ZpdmUgU29DIE9TVE0gYmxvY2sgY2FuIGJlIHVzZWQgYXMgY2xvY2tzb3VyY2UgWzBdLCB0bwo+
IGF2b2lkIG11bHRpcGxlIGNsb2NrIHNvdXJjZXMgYmVpbmcgcmVnaXN0ZXJlZCBhcyBWRFNPX0NM
T0NLTU9ERV9BUkNIVElNRVIKPiBtb3ZlIHNldHRpbmcgb2YgdmRzb19jbG9ja19tb2RlIGluIHRo
ZSByaXNjdi10aW1lciBkcml2ZXIgaW5zdGVhZCBvZiBkb2luZwo+IHRoaXMgaW4gY2xvY2tzb3Vy
Y2VfYXJjaF9pbml0KCkgY2FsbGJhY2sgYXMgZG9uZSBzaW1pbGFybHkgZm9yIEFSTS82NAo+IGFy
Y2hpdGVjdHVyZS4KPiAKPiBbMF0gZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYwo+
IAo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiBUZXN0ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hv
bGxhbmQub3JnPgo+IC0tLQoKQXBwbGllZCwgSSBoYWQgYSB0cml2aWFsIGNvbmZsaWN0IHdoaWNo
IHdhcyBmaXhlZC4gUGxlYXNlIGhhdmUgYSBsb29rIG9uIAp0aGUgcGF0Y2ggb25jZSBpdCBpcyBw
dXNoIGluIHRoZSB0aW1lcnMvbmV4dCBicmFuY2gKClRoYW5rcwoKLS0gCjxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJv
PiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
