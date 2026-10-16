Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E3BCCA46C
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 04:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6c6oJELWW+LWR/WdDnhQGmWfYrtC3SIvP4lOzqwDTk=; b=eJTwHxNZHai2C4
	jNR3mwCfLG+VeSh39idNvh6RayiFrip4gayaLlaj2qqXl6gd0FxKEACLiqJGbqvDMoAgCxZvTzIKw
	BdS2UiKzotL2gkCkDGFBR+zpAy/VsHQBYx592TReWdnNNVSDfSJf2PiCg+axGgmArpS0CwlTaNIQU
	Q+6pAcRhvBbdyJFT6yl9bBwaNoTMBBw0yzevMTQmckuS9J62mHYZ/d32WGqcvjaBMPK2AXergxcAZ
	H97gUoFAzvrfmn4r0hKHv3d5PvUKHdJub3P+0QY3qnlf+28nH+3yQRtdtvnfEMUkXc/SvM5cGSviR
	mnU5v6Ggz0mDLNTTye8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZZE-00000001xyZ-1UQS;
	Fri, 16 Oct 2026 04:29:16 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZZA-00000001xxK-0vzM
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 04:29:13 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35f036b17easo1522662eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 21:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124951; x=1792729751; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VE+oXeqJtxt10+roATNVYTIoZbK6JmE9LUgIix6h9S4=;
        b=cWS/rbhLwrlbSiraqKXNSTUEE0A+w1YNvJy6HIdCYGUVAllYjaCfm4fFk2/mB9HnEP
         eHlz2UvrCLSB3SxMOD2p8IAvmO6ol08jcHxvmUYwZpkqehFk7sBm3/wRqFjMXlfk8oJ5
         TRqkGGW41vwrSQeTHrIWjdCyNXQtiQjT7aufJWEwfKOEZzg96uBQAAKnJZj89CyKKz/W
         TGpfC7wYF9WpReQvHVvKs2u+RFLenPTBCxLlWEZQ3b+F2plF5gcr/ExhZeNd79nCaWNQ
         1wUvapN/Qb20GDnxY19Sh/jp1+x9OpSwV0vP+XeA72Uzi7j6c3x5/Yk6NjlpE1AUUdVy
         hWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124951; x=1792729751;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE+oXeqJtxt10+roATNVYTIoZbK6JmE9LUgIix6h9S4=;
        b=2tKaiqriVbuD/j+BKY+WLL8xLy0EiAIrlRcDRSnN3eZFQVrAXVIRlCyHy7HMhsAGfK
         XfaiCGp8lKaL7qEFmsZzY2+A3EM+dIG1xnyDWOV36bmGJB+diKfYI5VzCLKa7KrDkP7D
         UYcnaSOPiKaYKSsYT5Ee1iTybpeWcHmJ8/DlO6oWrXxGFOXoFRjyEVFGjFQd4c/AatBB
         2nJ5YeurEqXMauLuLNt6RxvgATlslWOGkUP6JZfa4bFTwqOznrPHzYqgJp8pm5JLBeBw
         56//NlPZ/KXMaAWiXuPtDMegZfeAGucDy7d4crvC7vIKCKg9LGJNo/Aatb2/eobpC2Lw
         JCmQ==
X-Gm-Message-State: AFq9FYIgK5aAVOBJJqYxKzEkuVn2hydG5pJSxX+kRoQLZsHzwU1n/FZi
	aC7/AKVq+aaedrdWzwlkSOm26DqDg/TNt+KLWGE+k4QFkCA3oN2NJQAi
X-Gm-Gg: AYBFou0X1aj8lwhyw4r5oWmPapWhbCCIVsXaRpTapaThano+xWk0Sa6hO425UqWRih1
	11+D0mthkNPJm2c0VIhCX+g5mok9Tfv4exrFjdEYTvHs6qCF4MD6rgTjqMbEwcNhjkM+McryXOm
	+N/aWxDaaoj+wFrdYh1GPdjm7Ugm73kspJn2rNglEK8EEApXjSBfsgtLcgnssApH3atf6mQn3gg
	kPUAbX8XJ02t/3VXGQIdPcb9JXTB29AprV0UB8GOeV0MuRnbytQQbvYtsLGonBD9g6wiP9L/TFc
	T4i9WWyE4J80jBsYSBI8FPnkF795Ds578VgUrC9+r2uzC8p+uqH02VBfH9k59NQWzONfI1kjODc
	D/fqVLZPzCDHe+zuiWvmvDAIDdnOCc+VJRowEYzw79uDUzY4NsYZABcD7/y2U0j6WfuKdgjK4Hr
	CwlEg8Q1pt3WZXWHZUVRbf+LCotKbFjhJjM03yGDxCqQcM2LtzDZAHRtW6Q1uJ9xh2OCzqzuq40
	jHgcDTvHxXWnrhIMS4PTQYogRY45WlngqxDjc5DejIAR77UBwTMszQbrQ==
X-Received: by 2002:a05:7300:aca5:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3581f594a27mr34564904eec.24.1792124951215;
        Thu, 15 Oct 2026 21:29:11 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2712719eec.13.2026.10.15.21.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:29:10 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only
 when available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:28:41 -0700
Message-Id: <179212492177.1746949.16726340758762763295.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792124948; l=595;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=L6unIE4vBVMEmCJjKLuJkLHsik5fxFgTZ9Kdo1htpnc=;
 b=27DVxDiUimq1C4Uy/7Q0HGA9NWUoxHvXFovcrKUJUroX0TJlDLg3s0cpKAVy/TOBS0GPanNx5
 rUCtz9qvgcnD6mbqCWffZJdUhz8lEJ9/UD8V743Qvj2+v9JegUWExES
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_212912_272681_E3CCB6B5 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAwNiBPY3QgMjAyNiAwOTo1MzowMCArMDIwMCwgUmFkaW0gS3LEjW3DocWZIDxyYWRp
bS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gVXNlci1tb2RlIHVzZSBvZiBaaWNm
aWxwIGFuZCBaaWNmaXNzIHJlcXVpcmVzIHNlbnZjZmcuTFBFIGFuZAo+IHNlbnZjZmcuU1NFLCBy
ZXNwZWN0aXZlbHksIHdoaWNoIHdlIHNldCBvbmx5IHdoZW4gaXNfdXNlcl9scGFkX2VuYWJsZWQo
KQo+IGFuZCBpc191c2VyX3Noc3RrX2VuYWJsZWQoKSAoQ09ORklHX1JJU0NWX1VTRVJfQ0ZJLCB0
aGUgZXh0ZW5zaW9uIG9uIGFsbAo+IGhhcnRzLCBhbmQgbm90IGRpc2FibGVkIGJ5IHJpc2N2X25v
dXNlcmNmaSkuICBod3Byb2JlIHJlcG9ydHMgdGhlCj4gZXh0ZW5zaW9ucyBmcm9tIHRoZSBwZXIt
aGFydCBJU0EgYml0bWFwcyBhbG9uZSwgc28gaXQgY2FuIGFkdmVydGlzZQo+IGV4dGVuc2lvbnMg
dGhhdCBhcmUgYWx3YXlzIGRpc2FibGVkIGluIHVzZXItbW9kZS4KPiAKPiBbLi4uXQoKUmV2aWV3
ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgoKLS0g
Ci0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
