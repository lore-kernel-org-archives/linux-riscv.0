Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A37B1075273
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rnpH60GUEbfggYsjzl8CUseCF3QIgggvoMGRKEaSeg=; b=ih9h6FNkVrZxw1
	NGA1m5zSpDTkUhyOVlU2YitWvGfrOKkPKPgg/os/4gqBZrGPbg4ABXbVhRw3q7U5kazU+QCjJJWol
	uyG0e2IQ7TgdGPDJ+QdOINUPcetm75uwjRrWL0EtWmF5BU4tGNTBpRLuhteia3yE0mdikL6nL3mh1
	pJUJ7/qlYHbHMLQfzdY7G72eXlO6j3XcqkJnnusBmrn4jr7PBbuI9cIrC/OWeRy52oj5L+gsGVZ/f
	TX3GhbPeT/rWDtB4QRQKao+BdkELYmXR+EdJs9iUuXaWLLApbUfTTrWEXfv7vnmBszxHwv9MiqL3Y
	zYUy+Z6ARbV4EDxzO/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38dx-0000000AEPg-2OeO;
	Thu, 19 Mar 2026 08:22:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38du-0000000AEOt-3Tld
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 08:22:12 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b04c9e3eb7so61115ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 01:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773908529; cv=none;
        d=google.com; s=arc-20240605;
        b=BUypqVOfF1NLTMlPWLa9gi/hReV0//o1NO/Xg6Yf5CXAsbyxUiE6UG185OXCiN7KTC
         dZSokwkc3cVQO8c3y6C3s43sV9jUbXooWAMzryQRIdYTRM4AuCRcxkgl8HyOAl6QjmJi
         jEbLYbjIBOH08drXBweKdD7YDnkqYhlOtTau53egosSeOV+2h3Cr/rgOXuyA7aEwR1Qw
         lRPwIffxirGHOBd16UCr/fUfCzVuEPUtm65IR/yof1Yn/4iMsSsoCbWTHDOmmWxUNJTE
         BI1XUUj3lAPx1wBAvWCrnE5Itw/+JoxPVTo2m0ArHA8Qc4y/7cDpBFmrtZFBRQUtXKK5
         FvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IHfTqB5YPEraYU2kXL8nscbmS2lKLIijP1hKdy0xaBM=;
        fh=lDKGN19NF+EN1DW9vo1olRTFBI7z8wEjoI2r8Q7PlSs=;
        b=lRuQdrTU3T/x/TbQdZG2wNMd/oXzKQHXth2gCe/zrfiG9NRHkYpnbRSQeJ+4dQCD+5
         BaxOJT85M8YrSDpG71GqYn/DLUMiJ+Ux3Njo8lDCEDwOJwn8QBLFGnlE9Rt4ZIFtv9ZI
         SzKSuS/UBOr+W6BS/2stvbHGiXFng0ZKPTKaCldC5cvWzrd4D03JTOszGHX/E5h9S9Vg
         4X6k1gNvMPlJi/cXNUL2Gmlu8wLljNa44qA1TPY8qQUd/lkfZrCtVLput6URDe+wkdpl
         1LB+6bnom72sZGtXbXIvh9ZjYP8RdelFGX7cAsxyzjnY7K8erZlGzhxRTvQWPJpB/e2O
         XBKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773908529; x=1774513329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHfTqB5YPEraYU2kXL8nscbmS2lKLIijP1hKdy0xaBM=;
        b=LQ1NLOLxdhgHky4ataWc9ZvQAt/GH/eAgykBnPFB3Z7dtVDV8REMG4nhLLyxgMbKRR
         TSoe/L6l8BQrYAW6InwDNw6/+9vKPahIN/luXDqc3TJTVczrCAkxS4jMMNL8urTc5hW3
         i2YkMiPIvij++iGiSGLCsGfF1U1jMlm4orJoSpzkve2/ySIgT4eJprFciEsSpsi26WBm
         eGNzZcwgDggVwnRJM4kcsthDdJyOtVQQRHLhD7yyj92xeu5f5pkzhi4MvIaexSYPx1LK
         ZRuGTwAXZIqv0b4JzMcYXFGZSLZDfrA9qVThyzn3gWy1oR2kuaPheQIM/Tec99wZwQOY
         4piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773908529; x=1774513329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHfTqB5YPEraYU2kXL8nscbmS2lKLIijP1hKdy0xaBM=;
        b=mhY4QsjrwYw3x8PL9G8IQ558k+Zi125unG6o9elxfVPpq4fI88MQC1U2IfureL7QkQ
         V59+Smv2OcUQsruaWt0tRHhvOftukv1MSzrleTkErDKoXjEGGX87TrFjn/r8cU5uW/t8
         zkMb3+/tH3CHlws/ugcO2XHr0qvLYjTx9+kXxvyiApeCNPNRtvlIbOUnpq0TSor8MZ6v
         J835LF7ZQW2/tXvJtzW62ttoc/MNr1eI1yp54FZScqKSRhXcYEj4w6brZSr3KdpQlmEm
         dj5RnfEJAdVdtp9cdMnYmrYPBTIfHJbwAc14H51bI5Lyd50FqqyyAIn6KJJh+MYhBMAU
         Ea5g==
X-Forwarded-Encrypted: i=1; AJvYcCV5fUNhBPDnDXuviJhy5cJy9z4onlxUjE1+DU5i4Y8bW8JY6N47EvAfJUGGTubSSw/D+3YNson6YyVw2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Axn1Sn0a8GTlDfOcnysxy/wnlJdhDf2hawmUVS8Z7AQqLXxU
	5TS8S+dL9zxoY3gJOM/kLes9vLmsLwsskWHjAXcu53PjPBhV1uSZyWelMObTBI+vHckFxNA7h5A
	1seoYZW5OWaYBSUiMy94RakI8Bf8ZUpHbL04zNl1u
X-Gm-Gg: ATEYQzxGSsV3BqXCWNuv3nRaXWO5BnNTH5uvZ31j02LpYAp1CQv7n2930z0lb2MfcTv
	nXQkkMyIbtups3YaaIIRnOgyyuC+WDGup4CA4WZTkkq8ZXvPvcr2V0TOT1QcNgUoZoeVOGAFXT8
	7GjUElOK4apDLMGfXBMG/WS2p6A2LnKNHSVdj0HRr6ZDUn22BVHUa/oEYQQdjxYWhBowfUkjPM2
	xIpZ7Z6eD9fQOB2HH++WO2DEH0dDURVk9lk+bGDFTGUEUYPIVNjBZOyKe/6Q2ld6I526FBjQp/S
	TN/nJQHo
X-Received: by 2002:a17:902:ccc4:b0:2a7:d266:d84a with SMTP id
 d9443c01a7336-2b079fbb39emr1497765ad.17.1773908528384; Thu, 19 Mar 2026
 01:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <813bc5fd-0c35-46af-aea2-90798154daaa@windriver.com>
In-Reply-To: <813bc5fd-0c35-46af-aea2-90798154daaa@windriver.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 Mar 2026 01:21:57 -0700
X-Gm-Features: AaiRm52YAXaNrkUnKO5zFLhl-iDdZJWeEPshCImbwceVdhaH6rxOGvGt1lbz9ew
Message-ID: <CAP-5=fW_O_sm9JzfCf=qDXyaffoLLRH3mob1zckESUHsG2rp-g@mail.gmail.com>
Subject: Re: [REGRESSION] perf build failed after 5cf6e76e4f4f ("libperf:
 Don't remove -g when EXTRA_CFLAGS are used") on riscv64 with gcc 13
To: Haixiao Yan <haixiao.yan.cn@windriver.com>, Chingbin Li <liqb365@163.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_012210_876175_D0695DF6 
X-CRM114-Status: GOOD (  16.32  )
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

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgNjo1N+KAr1BNIEhhaXhpYW8gWWFuCjxoYWl4aWFvLnlh
bi5jbkB3aW5kcml2ZXIuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gQ29tbWl0WzVjZjZlNzZlNGY0
Zl0oaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxl
L2xpbnV4LmdpdC9jb21taXQvdG9vbHMvbGliL3BlcmYvTWFrZWZpbGU/aD1saW51eC02LjYueSZp
ZD01Y2Y2ZTc2ZTRmNGZlZTU0YzAwNTY3NThiNjM5Y2Y0OTE5Y2ZmYmE5KQo+IGNoYW5nZWQgdGhl
IGxpYnBlcmYgTWFrZWZpbGUgdG8gcHJlc2VydmUgZXh0ZXJuYWwgQ0ZMQUdTIGluc3RlYWQgb2Yg
b3ZlcnJpZGluZyB0aGVtLiBBcyBhIHJlc3VsdCwgdGhlIC1PNiBvcHRpbWl6YXRpb24gZmxhZ3Mg
ZnJvbSBwZXJmJ3MKPiBidWlsZCBzeXN0ZW0gYXJlIG5vdyBpbmhlcml0ZWQgYnkgbGlicGVyZiBk
dXJpbmcgY29tcGlsYXRpb24uIFRoaXMgdHJpZ2dlcnMgYSBmYWxzZSBwb3NpdGl2ZSAtV2FsbG9j
LXNpemUtbGFyZ2VyLXRoYW49IHdhcm5pbmcgaW4gR0NDIDEzIG9uCj4gcmlzY3Y2NCwgY2F1c2lu
ZyB0aGUgYnVpbGQgdG8gZmFpbCB3aXRoIC1XZXJyb3IuCj4KPiB8IGNwdW1hcC5jOiBJbiBmdW5j
dGlvbiAncGVyZl9jcHVfbWFwX19tZXJnZSc6Cj4gfCBjcHVtYXAuYzo0MjI6MjA6IGVycm9yOiBh
cmd1bWVudCAxIHJhbmdlIFsxODQ0Njc0NDA2NTExOTYxNzAyNCwgMTg0NDY3NDQwNzM3MDk1NTE2
MTJdIGV4Y2VlZHMgbWF4aW11bSBvYmplYwo+IHQgc2l6ZSA5MjIzMzcyMDM2ODU0Nzc1ODA3IFst
V2Vycm9yPWFsbG9jLXNpemUtbGFyZ2VyLXRoYW49XQo+IHwgICA0MjIgfCAgICAgICAgIHRtcF9j
cHVzID0gbWFsbG9jKHRtcF9sZW4gKiBzaXplb2Yoc3RydWN0IHBlcmZfY3B1KSk7Cj4gfCAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+IHwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGNwdW1hcC5jOjM6Cj4gfCAvYnVpbGRh
cmVhNS9oeWFuLWNuL3Byb2plY3RfeW9jdG8vcG9reS9idWlsZC1yaXNjdjY0L3RtcC93b3JrL3Fl
bXVyaXNjdjY0LXBva3ktbGludXgvcGVyZi8xLjAvcmVjaXBlLXN5c3Jvbwo+IHQvdXNyL2luY2x1
ZGUvc3RkbGliLmg6NjcyOjE0OiBub3RlOiBpbiBhIGNhbGwgdG8gYWxsb2NhdGlvbiBmdW5jdGlv
biAnbWFsbG9jJyBkZWNsYXJlZCBoZXJlCj4gfCAgIDY3MiB8IGV4dGVybiB2b2lkICptYWxsb2Mg
KHNpemVfdCBfX3NpemUpIF9fVEhST1cgX19hdHRyaWJ1dGVfbWFsbG9jX18KPiB8ICAgICAgIHwg
ICAgICAgICAgICAgIF5+fn5+fgo+IHwgcm0gLWYgL2J1aWxkYXJlYTUvaHlhbi1jbi9wcm9qZWN0
X3lvY3RvL3Bva3kvYnVpbGQtcmlzY3Y2NC90bXAvd29yay9xZW11cmlzY3Y2NC1wb2t5LWxpbnV4
L3BlcmYvMS4wL3BlcmYtMS4KPiAwL2xpYmFwaS9saWJhcGkuYSAmJiByaXNjdjY0LXBva3ktbGlu
dXgtZ2NjLWFyIHJjcyAvYnVpbGRhcmVhNS9oeWFuLWNuL3Byb2plY3RfeW9jdG8vcG9reS9idWls
ZC1yaXNjdjY0L3RtcC93Cj4gb3JrL3FlbXVyaXNjdjY0LXBva3ktbGludXgvcGVyZi8xLjAvcGVy
Zi0xLjAvbGliYXBpL2xpYmFwaS5hIC9idWlsZGFyZWE1L2h5YW4tY24vcHJvamVjdF95b2N0by9w
b2t5L2J1aWxkLXJpcwo+IGN2NjQvdG1wL3dvcmsvcWVtdXJpc2N2NjQtcG9reS1saW51eC9wZXJm
LzEuMC9wZXJmLTEuMC9saWJhcGkvbGliYXBpLWluLm8KPiB8IGNjMTogYWxsIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpIaSBIYWl4aWFvLAoKdGhpcyB3YXMgcmFpc2VkIGJlZm9y
ZSBieSBDaGluZ2JpbiBpbjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDIxMjAy
NTEyNy44NDEwOTAtMS1saXFiMzY1QDE2My5jb20vCkkgd2FzIGNvbmNlcm5lZCBhYm91dCB0aGUg
aW50cm9kdWN0aW9uIG9mIHZvbGF0aWxlIHRvIGF2b2lkIHRoaXMKd2FybmluZy4gSSd2ZSBtYWls
ZWQgb3V0IHdoYXQgaXMgaG9wZWZ1bGx5IGEgZml4IHdpdGhvdXQgdm9sYXRpbGUgaW4KaXQ6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjAzMTkwODE4NDMuMTY1MDY0MC0xLWlyb2dl
cnNAZ29vZ2xlLmNvbS8KSWYgeW91IGNvdWxkIHRha2UgYSBsb29rLgoKVGhhbmtzLApJYW4KCj4g
U3RlcHMgdG8gcmVwcm9kdWNlOgo+Cj4gZ2l0IGNsb25lIC1iIHNjYXJ0aGdhcCBodHRwczovL2dp
dC55b2N0b3Byb2plY3Qub3JnL3Bva3kKPiBjZCBwb2t5Cj4gc2VkIC1pICdzL2FmMjQwZDdkNTdl
YmY2NmU4N2JjMmRmZjM0ODU1ZTYzMGE5N2VhZDEvNWNmNmU3NmU0ZjRmZWU1NGMwMDU2NzU4YjYz
OWNmNDkxOWNmZmJhOS8nIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNi42
LmJiCj4KPiBzb3VyY2Ugb2UtaW5pdC1idWlsZC1lbnYgYnVpbGQtcmlzY3Y2NAo+Cj4gY2F0ID4+
IGNvbmYvbG9jYWwuY29uZiA8PCAnRU9GJwo+IE1BQ0hJTkUgPSAicWVtdXJpc2N2NjQiCj4gJ0tF
Uk5FTF9WRVJTSU9OX1NBTklUWV9TS0lQID0gIjEiJwo+IEVPRgo+Cj4gYml0YmFrZSBwZXJmCj4K
PiBJIGhhdmUgY29uZmlybWVkIHRoYXQ6Cj4gS25vd24gdG8gZmFpbDogZ2NjIDEzLjMuMCwgMTMu
NC4wCj4gS25vd24gdG8gd29yazogZ2NjIDExLjUuMCwgMTIuNS4wLCAxNC4zLjAsIDE1LjIuMAo+
Cj4gTm90IHN1cmUgd2hldGhlciB0aGlzIGlzIGEgZ2NjIGJ1Zy4KPiBodHRwczovL2djYy5nbnUu
b3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMjQ1NDkgZmlsZWQgdG8gZ2NjLgo+Cj4gVGhh
bmtzLAo+IEhhaXhpYW8KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
