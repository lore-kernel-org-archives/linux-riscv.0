Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4381FC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 04:44:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A745B613BD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 04:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A745B613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Jhj1/3yx5KJ3KP8zTsMyCxN3Uf0UtCnK1oTaCNCADt4=; b=nXibiKnAvcKqFuNzq42FrQwF+
	GUh+dvIze5hX1Pq4+BO3hle6I9IkLNrYKrvSeYjASBc5FR4oxuNEgnmyJdhi+7cTHAavbAy62UKHG
	+Fpco2GDXcvBnWW90dks3DYuDb7K/EvPndxTbSEC72C+WZZldYOMyCLA66qBRSWnpxxkD+BWKBWv6
	dn9su082esgYvWSqhnqFe/pw879EhfD0ArabtP5ung8uNx4lQCHgayVauKTzWDJ3Fz8AGxb6xleDK
	GLmFFAX+pIzP6lR1VzYNUBIksxzTy02HUFu2J6H0IIgZIutlCRGuTQ+wD0mIRQxga1kqAmaLM0aHX
	CXq+QwsJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZngA-000cdc-3m; Fri, 23 Apr 2021 04:44:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnen-000cYy-Ul
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 04:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=vmwMfJKV2MTnV8e34ZcnkdOiNEV3WHgx/mF/LO5zhjc=; b=qIrnjNxGo9HyoV0EQ1cYUo+/0o
 eK1t5UhupjILRGsqbzGqNNNr2dV2yZMZJnU0cpNoDu7heMedK1md9Du+WLYERHtE/RDfKUb2Bxwau
 3N0fqvfBRyIccSJPZoGnUnDKkBkQupP92r5ooBJ0dtLZ40zT+QYTrPjQ6ozxrGwQXdqJIDD80XpUF
 J3zbI3jQbd+EzsBk2CnvSRfNWAuXzn1kyoTspOpYR9Tyg3vNzHZVL4aDelDvkns4M6JlIvjTOc9gx
 eOmhNiO6WQAcdwZY6D/eHcrpElrA0Epe5hGKHvipap/t/LksH+LHC+IU2aeprUf8+IFNPa9rDNkHp
 25KnLxQw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnel-00E9HE-6s
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 04:43:08 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so527644pjj.3
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 21:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vmwMfJKV2MTnV8e34ZcnkdOiNEV3WHgx/mF/LO5zhjc=;
 b=RYueedh/cAfcFVTIodUVgv+DSG8NBbF0QpyZO+xaUpKWH18+PY4lPB29KMYH9dUfOR
 lJkdYWiDlbqCIBtzV8KIBo73ujgxGIGMCRfFlA+cAjqHMCT2hGpklHCiIU9J1geUVXkx
 DH9CKKHwPPMhWh2oeqjVn1gnki1vuhFplYKQxzuSSxg3FujyaQ6Av2i6GWw6B4Ehpkmg
 qCpONwsOlQRCSI0lHafPMHKeMQxeJhkHv3ENcuT/vZEpnamG3FXylHBQXHBTeU6eKX3R
 R70dPddH4xPRuDHa8omrcc67GVQucJt0VUnKNl0J61GfTo2KqHRfFck06uEM9pROj6bX
 oqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vmwMfJKV2MTnV8e34ZcnkdOiNEV3WHgx/mF/LO5zhjc=;
 b=IWjmOaNPR4SGEygyh+0g8002AVBRtNMt9AMPIsuVKZ5kdwHY4duJV9/r1C/7EhzAtB
 A5Yb+LKMz6xuCaSkfhwXgOzN7wlYWTFfn8E168go25scxqAyfxDbnr3lSrXb8MpNDn1w
 d24OtsXTwNUmGfNrcqNZOw56CVx91UiBA6gexkdgNzwHjjsDtXlem0Hz6he7yymsXA+T
 8blNoteqp84NUoZx8opnwOJ/gV8caPHgzm03KurKEpG4SIP4GSw8GhnP5DVaUP3FySBJ
 03CLbE1cJ39a1EgHdbSs1IwT9T2kqK6F+497Jyxd75Yz2VuMQhoHqb0SvDPS+QxFNBL+
 V7SA==
X-Gm-Message-State: AOAM5301gS/lmewbXh1ui6d3pcDl+yYoyK+Et0MTPwifuHfmvQPjjNjN
 ABiPb1GyjcGVsoS5OizFUlkKlQ==
X-Google-Smtp-Source: ABdhPJxK2Og4+NYNGBddpr8IYw3HqTOQjisfWTquNVdzdYRnApFSJvMMN5algJYF50FdZYhhcfRV3w==
X-Received: by 2002:a17:90a:6c88:: with SMTP id
 y8mr2462165pjj.38.1619152983812; 
 Thu, 22 Apr 2021 21:43:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u17sm3351189pfm.113.2021.04.22.21.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 21:43:03 -0700 (PDT)
Date: Thu, 22 Apr 2021 21:43:03 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 21:43:00 PDT (-0700)
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
In-Reply-To: <CAHCEehJajVGWnAwvX+Jg3_U=WNxaNq89Xq3uvcfcHzt04qNfMQ@mail.gmail.com>
CC: lorenzo.pieralisi@arm.com, jh80.chung@samsung.com, zong.li@sifive.com,
 robh+dt@kernel.org, vidyas@nvidia.com, alex.dewar90@gmail.com,
 erik.danie@sifive.com, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, 
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, aou@eecs.berkeley.edu,
 sboyd@kernel.org, 
 hayashi.kunihiko@socionext.com, hes@sifive.com, khilman@baylibre.com,
 p.zabel@pengutronix.de, 
 bhelgaas@google.com, helgaas@kernel.org, devicetree@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-f3dd2202-8d2b-4e17-9067-c4521aac8125@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_214307_282239_659A0028 
X-CRM114-Status: GOOD (  16.59  )
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

T24gU3VuLCAxMSBBcHIgMjAyMSAxOTozNzo1MCBQRFQgKC0wNzAwKSwgZ3JlZW50aW1lLmh1QHNp
Zml2ZS5jb20gd3JvdGU6Cj4gTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFy
bS5jb20+IOaWvCAyMDIx5bm0NOaciDnml6Ug6YCx5LqUIOS4i+WNiDQ6NTTlr6vpgZPvvJoKPj4K
Pj4gT24gVHVlLCA2IEFwciAyMDIxIDE3OjI2OjI4ICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6
Cj4+ID4gVGhpcyBwYXRjaHNldCBpbmNsdWRlcyBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRy
b2xsZXIgZHJpdmVyLiBXZSBhbHNvCj4+ID4gYWRkIHBjaWVfYXV4IGNsb2NrIGFuZCBwY2llX3Bv
d2VyX29uX3Jlc2V0IGNvbnRyb2xsZXIgdG8gcHJjaSBkcml2ZXIgZm9yCj4+ID4gUENJZSBkcml2
ZXIgdG8gdXNlIGl0Lgo+PiA+Cj4+ID4gVGhpcyBpcyB0ZXN0ZWQgd2l0aCBlMTAwMGU6IEludGVs
KFIpIFBSTy8xMDAwIE5ldHdvcmsgQ2FyZCwgQU1EIFJhZGVvbiBSNQo+PiA+IDIzMCBncmFwaGlj
cyBjYXJkIGFuZCBTUCBNLjIgUENJZSBHZW4gMyBTU0QgaW4gU2lGaXZlIFVubWF0Y2hlZCBiYXNl
ZCBvbgo+PiA+IHY1LjExIExpbnV4IGtlcm5lbC4KPj4gPgo+PiA+IFsuLi5dCj4+Cj4+IEFwcGxp
ZWQgdG8gcGNpL2R3YyBbZHJvcHBlZCBwYXRjaCA2XSwgdGhhbmtzIQo+Pgo+PiBbMS82XSBjbGs6
IHNpZml2ZTogQWRkIHBjaWVfYXV4IGNsb2NrIGluIHByY2kgZHJpdmVyIGZvciBQQ0llIGRyaXZl
cgo+PiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2xwaWVyYWxpc2kvcGNpL2MvZjNjZTU5
M2IxYQo+PiBbMi82XSBjbGs6IHNpZml2ZTogVXNlIHJlc2V0LXNpbXBsZSBpbiBwcmNpIGRyaXZl
ciBmb3IgUENJZSBkcml2ZXIKPj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFs
aXNpL3BjaS9jLzBhNzhmY2ZkM2QKPj4gWzMvNl0gTUFJTlRBSU5FUlM6IEFkZCBtYWludGFpbmVy
cyBmb3IgU2lGaXZlIEZVNzQwIFBDSWUgZHJpdmVyCj4+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvbHBpZXJhbGlzaS9wY2kvYy84YmIxYzY2YTkwCj4+IFs0LzZdIGR0LWJpbmRpbmdzOiBQ
Q0k6IEFkZCBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIKPj4gICAgICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jL2I4NmQ1NWMxMDcKPj4gWzUvNl0gUENJ
OiBmdTc0MDogQWRkIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlciBkcml2ZXIKPj4g
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzMyN2MzMzNhNzkK
Pj4KPj4gVGhhbmtzLAo+PiBMb3JlbnpvCj4KPiBIaSBQYWxtZXIsCj4KPiBTaW5jZSB0aGUgUENJ
RSBkcml2ZXIgaGFzIGJlZW4gYXBwbGllZCwgd291bGQgeW91IHBsZWFzZSBwaWNrIHBhdGNoIDYK
PiB0byBSSVNDLVYgZm9yLW5leHQgdHJlZT8KPiBUaGFuayB5b3UuIDopCgpTb3JyeSwgSSBnb3Qg
dGhpcyBjb25mdXNlZCBiZXR3ZWVuIHRoZSBMaW51eCBwYXRjaCBzZXQgYW5kIHRoZSB1LWJvb3Qg
CnBhdGNoIHNldCBzbyBJIHRob3VnaHQgbW9yZSB2ZXJzaW9ucyBvZiB0aGlzIGhhZCBrZXB0IGNv
bW1pbmcuICBUaGUgRFQgCmlzIG9uIGZvci1uZXh0IG5vdy4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
