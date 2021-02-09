Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB888C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 13:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DFD64ECF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 13:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DFD64ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XDo+UXwlIZeWBGFeZ9NCUdqYjkrIfdri5PP/i1Bufu8=; b=tpSIkDTl9nlLGoaEGEaHGkJyi
	hquhmiKZ3Sln0IEI3z1ixxiUJpGt41Db2SvJhD9X7m4ZUR5O/L7MEtYGBE8Enn5OnwcPHZUVHCGZR
	kXP+sAlUN1tPFmHS3fFmWdyWIVg3wjnL5hqQYneraDvNgipEMvjjmO1GaAaHWlny6ytM9bVIRy/WV
	eh6tbqapE8l2DqgqJ5To+fUK7HRebyDgLYyx/KjSX4CScrdsfJGkYH2rayGQ1ey+K1g6ZblNBy/+d
	eAHcq3Kv38qiLfinZGPentGVuXVG58LdgEV22HHWEvBDN9foaiREhMJFr78rmJKdauiBAZaSKVX7P
	fQqC3XLBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SqZ-00085S-KC; Tue, 09 Feb 2021 13:14:27 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9SqV-00084e-Cg
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 13:14:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j11so3066481wmi.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Feb 2021 05:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tfYX0wt3USJYRHS86M/jbg23A6PG2wfr98UB/n5XB70=;
 b=MI2siviaWG4FW4pqxYi7oteXhadD0+TYF41MswfCH+sUoG/vNCXv9LbrkoFmJMCa6V
 WJEPu7kCLyVPrd36IZ6KEcz/T+Mh/mUD73pwuYJXtuPuEwSCVceHAeMpt852edVEa62W
 vv2Va7YB4e+4Z94oporGZ/bRSANlVGpJwmhJy5BP3Y0Zxw84N5UDfIO0vqTVZiB8q9qM
 qGlxTSic0q/NEpwiCUXICeDNgn54pAuy1qOfLKn5i7vV2tLl3QVCRAQ6b+RiyxKhGROg
 QVFlam0EloJwd6TSuamtAQ1a8blzzoOCKu8BA14polI+4ARGiHnFbSYX5zoQTuIHUtD3
 JKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tfYX0wt3USJYRHS86M/jbg23A6PG2wfr98UB/n5XB70=;
 b=SBFCVS2HKlBsiTKGyfL3mrkvNijPAgAFC8s8aegFjtXsc8+wr6s7m9DA+gyd0E1icf
 vUG3DOs8NOrtklrqQ/Dw7ycPHt/f3W41ov1X4xT0x2XEnh+bHhxwg1XXegEO+iClVvN7
 +mUZPZ7bbnqZfHG2E8q+zdU8IcoxQ0s/BbqCV/QXOFEJiue/dA6NHh5ZAmUZE9Mqw7pt
 gey3N3ptAja1RoaGtx0Toeh6lw0oESdZIzBAxk2qFwUxRHx/gOYaLO0wHrTrQZ1sOsvL
 UxOMdsfG1nujIHH152BHGlqOCTpnz4mxFh7aFiZPF69PM+pMPmLikQOzgrVATxLoaFR7
 q6+A==
X-Gm-Message-State: AOAM5338VOrSozJH1RC/tP/71lFH9rY2McJgmzOYLvix/ip/NN6/wF9m
 NLVh687+3kxkZav/VjpTqFh2Gg==
X-Google-Smtp-Source: ABdhPJw/ND+ieFVszx8C7suT7yUN54RwNU63dqlb3pI1GGY4l2n/sJa2zp3gTt5zseO+JTezpm/fAw==
X-Received: by 2002:a05:600c:24e:: with SMTP id
 14mr3405055wmj.87.1612876460027; 
 Tue, 09 Feb 2021 05:14:20 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:4cbf:512d:a355:e705?
 ([2a01:e34:ed2f:f020:4cbf:512d:a355:e705])
 by smtp.googlemail.com with ESMTPSA id n15sm35009363wrx.2.2021.02.09.05.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 05:14:19 -0800 (PST)
Subject: Re: [PATCH v18 08/16] dt-bindings: add resets property to dw-apb-timer
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-9-damien.lemoal@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <28fb65ca-c41a-ae15-adb9-bc0c6024f0e9@linaro.org>
Date: Tue, 9 Feb 2021 14:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209123014.165928-9-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_081423_567411_C0D92199 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkvMDIvMjAyMSAxMzozMCwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gVGhlIFN5bm9wc2lz
IERlc2lnbldhcmUgQVBCIHRpbWVyIGRyaXZlcgo+IChkcml2ZXJzL2Nsb2Nrc291cmNlL2R3X2Fw
Yl90aW1lcl9vZi5jKSBpbmRpcmVjdGx5IHVzZXMgdGhlIHJlc2V0cwo+IHByb3BlcnR5IG9mIGl0
cyBub2RlIGFzIGl0IGV4ZWN1dGVzIHRoZSBmdW5jdGlvbiBvZl9yZXNldF9jb250cm9sX2dldCgp
Lgo+IE1ha2Ugc3VyZSB0aGF0IHRoaXMgcHJvcGVydHkgaXMgZG9jdW1lbnRlZCBpbgo+IHRpbWVy
L3NucHMsZHctYXBiLXRpbWVyLnlhbWwgdG8gYXZvaWQgbWFrZSBkdGJzX2NoZWNrIHdhcm5pbmdz
Lgo+IAo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPiBD
YzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3
ZGMuY29tPgo+IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4K
PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBEYW5p
ZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KCgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc25wcyxkdy1hcGItdGltZXIueWFtbCB8
IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NucHMsZHctYXBiLXRp
bWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc25wcyxk
dy1hcGItdGltZXIueWFtbAo+IGluZGV4IGQ2NWZhZjI4OWE4My4uZDMzYzkyMDVhOTA5IDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zbnBzLGR3
LWFwYi10aW1lci55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RpbWVyL3NucHMsZHctYXBiLXRpbWVyLnlhbWwKPiBAQCAtMjQsNiArMjQsOSBAQCBwcm9wZXJ0
aWVzOgo+ICAgIGludGVycnVwdHM6Cj4gICAgICBtYXhJdGVtczogMQo+ICAKPiArICByZXNldHM6
Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAgICBjbG9ja3M6Cj4gICAgICBtaW5JdGVtczogMQo+
ICAgICAgaXRlbXM6Cj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8
aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8v
dHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
