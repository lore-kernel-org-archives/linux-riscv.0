Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C8FD59D84
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgXGG0NUrV1UwbY+Gk6feyNcwe6nK1z9IBgRVTk0yrI=; b=Fkp0LVQRCG/wSd
	ohMFRnXtiS5QqO1wrwSrDTqW6qMWPmgsBDc+4KKelpYCR8JAsL929f/vW+LC1XPv6VieWtoGTfhTO
	t7xW1enIyktOI19m/Y4bPMtF8EfpdY+bUXGJLTFs4lSZMM1CFuTmGCQIdr20LR5ylJ33Ofpv5AWCB
	ALK6LpkJSJ/hI5UpxzUd+acL+P6tyhS11QS3c7SdTw4POKFwhzBEMxBY57SwQc9pz7R850c079n1J
	hTY7oGZwTYQJN+HG214MnJeHiNKVVr6oZ5HeP3ioXq3GBsJXXBuUkJVWSuKo9PlRlBSo305RgABNO
	qg4SFyi6zgWLlt5uc8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8C9-00000000xVg-1dyB;
	Fri, 12 Dec 2025 18:48:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8C7-00000000xVL-0Ee5
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 18:48:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47774d3536dso15058405e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Dec 2025 10:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765565325; x=1766170125; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws8si3q8m+pORfnElCi6zW3h1zosQU2jocpsY2hNquM=;
        b=ML4StUKJypQsGqlBRVJe988X6g8x+cilfVqnVOQjhmJApgG5rOnk14F6mbAiYeLf+z
         culXEn0ix6ZydtgptHV7+WpQcTyZIGKy7eCnQ34zSEwg7bQCZ8s+UBcPLvVHuAnmd5V6
         y4QWSXahc/2cFWEEhMUGZxFuwSvftxLDmt6KUgLTlfq3UR5aHOaKvEFLzjx+WWGOxPwN
         Vfe4JUxJOrQJD57EVt98zIRQoPuCuziNsJosKRDpSHxCRHgL5uNtA4aC3NenW4JFOTeN
         njdHYJqo3mcmg1c4lbst6F4elEsbicn29Wr6hfMluIfKB/wxt3JZ+nfkWF+/b1Juyxlm
         fu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765565325; x=1766170125;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ws8si3q8m+pORfnElCi6zW3h1zosQU2jocpsY2hNquM=;
        b=vmFlppfJBZqHYOfxQOhlvoQZe4VSUo3huvO7DmXiawmiJ1yKUqjVZjnIiR0r4UUGd6
         Wm9tzkRjbxaNENmJeVrFk4xwIJYO75wjQaP8JTo1VxHvvUZR2hvvA6jZQGFh3CQtMCwm
         an4FvHiSRrvt9Nhryk1qn1KwkplbTlZINSkVK92o/elLeC6dbJ3MFQdN2RzARkVrFHsn
         TkMdXCU0ecO29o5tr1c2TIHC9DfpMJqxsPekcGp7fVcVokF6Uy101atEVK9YZKpJV217
         WqNUhzEigjixuvQc4Nvd+c9+5lEabbxGLUEFEgMdATmxVPiTtSRY/egqH5tCSfDAQvNI
         Q3wA==
X-Forwarded-Encrypted: i=1; AJvYcCVtjjrY49p+FIH8PwLzYPNS4SQXz9yrJVOxyomJ6fGMQ8foE9Ie7XTzj9wtoj2jwO/5UPBPWQtFAZ6QGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo01h0utpbz829LBAKgcKDfPv3QOa8xVXc846Js2Y50kHNyK7n
	0Z4yUB4MxQJfy1ZjSPumjSnIQstQXBaO1fMZ+obdLrK0RtY+LmJ1i4mD
X-Gm-Gg: AY/fxX7Y+0oX6AD1qmfNPOd0GoG9tf0Wgia//PPQySCodEjx7XO4jFQQeSPUdWQ6ybt
	VPKgPyf+6FCs+edPieLKVQ5iGh9jq+BYFCnYmAwrFBdfuX2f/1rt+k9Ch1ku/OWRAy199ahbgJn
	dF8y+vFSjXLfWV3tV1hsOSwwIl/BJNUWejb/1U3JlJWmHax/VakBhtgoM3i5d1Cy90QVCfCKNx4
	Pbv6U+WbuhioZy8UTX49pny5+kDQA71vdQ7mX34s4B4Mg6zbGaHv0E2d/9JewH+eu0zjz3+vpcM
	DtQmt4Wi5RTPsMUxEs6pynaqtwFLCGRkZo8mcWay+UVqexIeiVqLOzsDe2kM7PJiOoE9I1ZXGiJ
	LraRQ5tMeByu63B6beb7Xh0w8a/H8Ijifp+QHQeBMDYOg5IsIFDQVUAOUgPDo+k4eRGhIZVvRmp
	3i7rkOsBw/XsK2XRP9TOsRNrYXypy0KxilIN2yusB/mBxXNhlG5OG7h8d03M+l4btK/Uw=
X-Google-Smtp-Source: AGHT+IEcsB4SsohMiuSMRBVsLyNXjKi7YpKhM33MGaetXAZYk3yBX6k/E4+lyPkq3E+DCl/tx3dVDg==
X-Received: by 2002:a05:600c:1c89:b0:479:3a8e:e490 with SMTP id 5b1f17b1804b1-47a8f2cb09dmr38671305e9.18.1765565324767;
        Fri, 12 Dec 2025 10:48:44 -0800 (PST)
Received: from smtpclient.apple (bba-86-96-93-57.alshamil.net.ae. [86.96.93.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3240fasm47202405e9.0.2025.12.12.10.48.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Dec 2025 10:48:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
From: Anton Stavinsky <stavinsky@gmail.com>
In-Reply-To: <20251212020504.915616-2-inochiama@gmail.com>
Date: Fri, 12 Dec 2025 22:48:29 +0400
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Longbin Li <looong.bin@gmail.com>,
 Yixun Lan <dlan@gentoo.org>,
 Ze Huang <huangze@whut.edu.cn>,
 dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
Message-Id: <A0AF03A6-1F0B-462D-A088-3B4DF6BA6292@gmail.com>
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-2-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_104847_123376_8E56B978 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


> The DMA controller on CV1800B needs to use the DMA phandle args
> as the channel number instead of hardware handshake number, so
> add a new compatible for the DMA controller on CV1800B.

Thanks a lot,  Inochi. I've tested on my Milk Duo 256M board. 
Seems to be working with the I2S driver, which I'm working on right now.
No issues with DMA interrupts anymore, DMA router used right channel. 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
