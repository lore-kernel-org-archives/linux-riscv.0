Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F0CD1CDC6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 06:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9s7PtW8yI693LOifaHXAMaELVavNmaLKhfxVFHPNOcY=; b=4l18JZVvWzE/X3
	Edb+y3316RLnfVqmj4H2Qv6VwXEAF2W7xaonNpRVgPzEi1ETQ66ssVlo/gTkU+tDP0A6RB43tMt8b
	ZbIWNRQL6fED0nDXFJzY/uh6KywHNaiBN0hIcbGz+y96iV48WGqsZIMe5+9nIVd9xMW+hVFOrz9Jx
	5TatBVqjuvbEcatAoDNUYxs05SCCOa8jOBLrchnzq3US/RQZ7hHZh7DLJ21cP7aH7MKdWs8qMTVHv
	26jMGlg3PWjjWXsdnKqiv4uwSCb/EBpIq92VQq9N46U1Aj+RRhiqhIgD6p+B//N0aqwf7WlzlGcs9
	2s9P0+Yh5il12whpZGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSr3z-0000000DslN-0EJg;
	Tue, 09 Dec 2025 06:19:07 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSr3w-0000000Dskp-1szp
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 06:19:06 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-343f52d15efso4923125a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 22:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765261143; x=1765865943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vIa6jqcHFzv9iZgum8ltDygq/7mCA6BUmLPiZxq3KhM=;
        b=jcbVYQG3dMbBC33n0EuCdEKBsoHwMV9E7ecYUMl45ClLSCrUR29q97WzHgxIHDWp2P
         EJLtCR9Vbgt8vOprRrZtTR1Op4bUCW47Ht3/9O/0nZCddGnx54RoyU1zD2QquQEY9ehN
         giMwQYwiQH7N9TjSwh+pUXVmKKV5VU6zop+MPffih5R3X1B8RlTKoTzaSViPyqxxV5Fa
         hV5ArhWIzCKZZhCe8Mz8qMgYZPHiV0hyQNaL6jrpeicl+5jFzaai6SRhJTuqrRUl4683
         8ym/A9ZVSkOV5vrayDfTQsiWstyhcVjVQxSeiXfYSIUWZAiC5oUe7T2n8iVwNWau7/kN
         KSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261143; x=1765865943;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIa6jqcHFzv9iZgum8ltDygq/7mCA6BUmLPiZxq3KhM=;
        b=rJq3+Jq7Am8nhc0I4HaxWFNd+brs3jKq876dqN4ycQ5ZOVPYjvVKQC2cjJ5omM9xEn
         ks1eePlhoPTzp/J1qokNd16CADKoIlfHZ9jXXXL1LgpwILCU6C4NybJHf9WMbsDHN4J0
         7iN+9BY8tvHHYW7A5t7OtV1BDmMAS7PI5p1/YZXBa0Ks8lpesSG5BrwTJFTVW7DXmxOd
         PN+AVSqye4p7jXJnxmwfZyYMrC+wYgS+ho3RdVLXnG/DgGvT+ttOBLyJ8NkRZ2zQ06dv
         ULosL287JrUxTcsVOyEiVF0Hxsu/ZgOrTM8nmgg3AhrE0FrCUUIlDf04yv71eRrFd7bj
         cD7w==
X-Forwarded-Encrypted: i=1; AJvYcCVEM/AxQCuZYZHEmkP+r3YQtfYrYcEF7EanSh+hbM/ldEAoy+R0TiMfJvIXi6pANGy+sqtTvorvnOOX+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/CatN2BgWQeDRYvo2C1WD8NJT+VVJB+UAejvIcN35uGIqQZEm
	XzcsWQzc2IjTYVkMT37SYzDgoW5bHyqIEmCyOdJSLZ5wxLBXIJKkmXFxG3oWoznZP3k=
X-Gm-Gg: ASbGncuKlE2lY1ZbFJ/530cx2QVFZfMC4loEM/aF/Umbga7EC61B5qh91DmDmu2JZUd
	Z4ViAp8piNdkb4qIq0dhhhVuIipMijty2aLXlQkYdfWlK2HpWoWIWOqOb1CEcyaO4zbOELYvlmK
	ynC0hIGUOamqRUrH6mujPMbr2f4lq45Cw4Qm4cE9L52moVpDk7OWEMYibAUz2vF4l8/cthmV5Y3
	1Zrylvzk2Cg8fBos4QKANycpYQahCGUpgFiaGyRz0K8zzGY8ItKGJJrnmqfx5co+u+lCuqxSLqf
	sAw1KQjd57YZRL3H2DtcD9cRHRG6b1DOGszBirawh9B2zAu/B5phkLP8YsWI8A9NZGotrk2dlP2
	Bdj8YT4M+G2DWctIk6usy0FxVRvuxSRn41PA2L60T/3TX9a5u8TCqVkxDk9Em70qM2KGJpHIkCJ
	9N190loZUcblC60ajnq++RrFR4BxZD1r0=
X-Google-Smtp-Source: AGHT+IF3CV82MN0YNFqOU++plw/a37xGD2xf2oy84fWcz0qoUsA3eX7qyuzYpkhkVT+G2+ljIRTWbw==
X-Received: by 2002:a17:90b:1e53:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-349a25b4969mr8093659a91.22.1765261143392;
        Mon, 08 Dec 2025 22:19:03 -0800 (PST)
Received: from [100.64.0.1] ([165.225.110.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1161413a91.6.2025.12.08.22.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:19:02 -0800 (PST)
Message-ID: <d8fa12cc-7a03-4954-8ea5-1e2edf9a149d@sifive.com>
Date: Tue, 9 Dec 2025 15:18:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110
 compatible to VisionFive 2 Lite
To: E Shattow <e@freeshell.de>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Hal Feng <hal.feng@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251206204540.112614-1-e@freeshell.de>
 <20251208-jogging-morally-9b787b7ab1b8@spud>
 <a18850ad-b6de-4444-9daf-a4a653f4f9ae@canonical.com>
 <0bb12889-cb28-44e7-b2d6-7ecba6264d1a@freeshell.de>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <0bb12889-cb28-44e7-b2d6-7ecba6264d1a@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_221904_514242_72E9674C 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2025-12-09 9:53 AM, E Shattow wrote:
> The unanswered question what I was asking in the code review of StarFive 
> VisionFive 2 Lite series: What is the normal thing to do for compatible 
> strings of relabeled silicon when there is a suggestion of different 
> operational parameters?
I don't think we are very consistent on this, and some of it depends on how
different the binned chips are from each other.

Example 1: Rockchip RK3399 has several bins. RK3399-S and RK3399-T just override
the OPPs, but reuse the SoC compatible string without change. On the other hand
RK3399pro is a superset of RK3399, but uses a new compatible string without a
fallback.

Example 2: Allwinner H616 (https://linux-sunxi.org/H616) has multiple
bins/packages/die revisions. H313 is a down-binned version of H616, which reuses
the SoC compatible string without change. H700 is a superset of H616 (same die,
more pins), but uses a new compatible string without a fallback.

> I can include the (paraphrased) above summary by Heinrich, yes. Although
> now I doubt whether this is the best approach, when removal of
> "starfive,jh7110s" compatible is potentially an equally valid fix, or if
> we're rather considering JH7110 at 1.5GHz maximum to be a superset of
> itself at 1.25GHz maximum (JH-7110S). Would we want to change all the
> JH-7110 boards to then have JH-7110S as the least-compatible, if I am
> understanding that meaning of "superset"? I would like to know what is
> expected.

If starfive,jh7110 is a superset of starfive,jh7110s, yes, it would be valid to
add starfive,jh7110s as a fallback compatible string in all of the existing
board bindings. But this is not very useful, as existing software already looks
for starfive,jh7110, and you can't replace that without breaking compatibility
with existing DTs. So the advantage of one compatible string (mostly) covering
both SoCs only applies to new software.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
