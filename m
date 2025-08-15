Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BDFCA0EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sARj9UfR6OofKpk/0dg5m1E78T2rV7BF5KGKR5IEoSQ=; b=M/YK79I2JeZxr0
	Kqtq6oev5gkc8oMj+MnIYQtbY4zec+ij6G6hQrrq3cYqQj7frpdmcKmEso0dZZkINjBPSozhj+P1B
	/0Nqb4c5Dx9vCDMMeTHEwwORJzPXzRkfP91Yj3C2LML9qShfBR3mgDiEVMLT+7R5RekPz6DUXNDUa
	/LBAa9yYAmTVGWrOnTzf4Nwopsz407WvI+WE90/Yt8CFRzxFWxz6Yjg85JdjYZqYol3MpD4RkhSey
	pdeZWqWUtHbJICAlTc72LfnBoWlyU4UPcRtymDBZV73f87UZSRwzbNJ0CnoS4yw7qrWyG8C9gSkdS
	Nqf+A7qOLKvG3Gk+eF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiuq-000000010IH-0MBG;
	Fri, 15 Aug 2025 01:07:32 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiIO-00000000tYU-1YSY
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:27:49 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e932c98433dso453421276.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 17:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217667; x=1755822467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUCl8OpntS8ItAPbimfsEK2ia5Dsdkh5KT5jw4r6KqE=;
        b=Zep1hg9FWyo3JqhNktz+EvyU9bRlsGpLQDgXpj+YT5wAO/ZuCq8l13dPzXCzjltxeP
         wEaYT4kpQMKPGoXKvZlbJrgVLu20q6TPkp8mH6I1unigp/2vJtIgrgh1bMvcbwcwPo0o
         /FT+H1o2AzcTqnOlKgqUDVrUGR4QY+AfDs1FFUV7393NaOEXRXrCkiZ84HnoZpMTRS9a
         pqtqhtgPrQRODGixjaRkVbMjM1yyfqv8U4Bstx3hpWBZavupPGQ+nhsGSzVYUjBou+xo
         OhGEc/7C9rQ3Ysn9MR0bygoAbc5KddwX/3Ow3BG+o+y8TAzYWeZ7a/O7cDX3gKZ8Yj9z
         ukZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217667; x=1755822467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUCl8OpntS8ItAPbimfsEK2ia5Dsdkh5KT5jw4r6KqE=;
        b=wk1NvKqjloI4ZnEbQzSL/Jz2YVfBlKB3FcmWaUbKaKAoSxzbVC+soGv4FaNZyvUBOd
         +9uCwHL+qnhWcaGL9+kHmIOwuYaFQ4m7/onOhwq0dzxnX7tkGO5XjlKRyi9y99nZBTCk
         aQAjWlS86GyucCJBTK/sA+iIDP2iPhNcFzJy3jI0nfXMQM9nIe69ib+xL4+Tx1jx+rus
         nGRufTreqJR5MkoqaPXvrRj12WIpFHMoAcc7q3roiK7fPtcPrb/XNI9i5HobG0wXZFnA
         aHdOjDY8hiCidUZcIcf2NpxKy55dkSMhhMu45fZdfZHA1teaihl9fbzhRvU1BxIYp/pQ
         Azww==
X-Forwarded-Encrypted: i=1; AJvYcCVzVbJTBGklMYb2xMR/kCaX+PjXcw8d4o/6GS46E9vgxRcBjxjOus1G6UiEaJmSetn0LKO8E/P0PQ7VdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcGKR7UBgVQYvCwxaWCkzl/8f2295kr7zsKyOSdmSBvD0VZvCa
	vHx0nI4A0HhnS1PaWWR1GPrIU3nfHlrSFVawicqAjcTKIS9GFuXvJmycOLTbG7BCZM3wLjW9M77
	K+MS/tOCRZXlmHHSoKlay7Q4pjBU+sxRniBt4ux7QDw==
X-Gm-Gg: ASbGncvFibF50yYRVyTfYi6LITT9TxiJtkLe8TAM60K34n0O27SnHVmYCU/j6eodSnw
	vZLiYjqZsBMUjJ8IWDmQqthXrUImnlsgXvfgLL5JRiFLTQvEihAeMXl1HY08vlZEL/Wf7OpHl4/
	gM2MUaGDcJScw/1puyOdfGINQZzYYD4VSOXzJN3u7xg+dYrXH4SEMOggvmKfgxhXS0xVYT41h0N
	iDKPh2a
X-Google-Smtp-Source: AGHT+IFr4Z98dVmGfz60J9x6/CkZNbrFkAtGVlc71VNieoJ/ZNAByVYswqD8H1LwHZHBqhIOt7I8+tOkzgyQcZyNca4=
X-Received: by 2002:a05:6902:270a:b0:e90:8278:5f2f with SMTP id
 3f1490d57ef6-e933251c90bmr227607276.48.1755217667411; Thu, 14 Aug 2025
 17:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-1-8b0f5cd71595@riscstar.com> <175255113305.1485.18050987625765048681.robh@kernel.org>
In-Reply-To: <175255113305.1485.18050987625765048681.robh@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:27:35 +0800
X-Gm-Features: Ac12FXwajLIeOVETGqUxgx2qIW1SxmU-t78A8xhxjUwRc93jsVMDeN2uzl944DA
Message-ID: <CAH1PCMbpxUHfFbBCDYYE6F+DCJHyHoesf=9f-Sw0p=147vEQag@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Alex Elder <elder@riscstar.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_172748_405076_27F56227 
X-CRM114-Status: UNSURE (   8.63  )
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

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMTE6NDXigK9BTSBSb2IgSGVycmluZyAoQXJtKSA8cm9i
aEBrZXJuZWwub3JnPiB3cm90ZToKPgo+Cj4gT24gTW9uLCAxNCBKdWwgMjAyNSAxNzozOToyOCAr
MDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24gZm9yIHRoZSBTcGFjZW1pVCBLMSBQRE1BCj4gPiBjb250cm9sbGVyLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gLS0t
Cj4gPiB2MzogTmV3IHBhdGNoLgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL3NwYWNlbWl0LGsxLXBkbWEueWFtbCAgfCA2OCArKysrKysrKysrKysrKysrKysrKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPiA+Cj4KPiBSZXZpZXdlZC1ieTog
Um9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPgoKVGhhbmtzIFJvYi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
