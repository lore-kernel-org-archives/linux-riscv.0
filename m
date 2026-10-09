Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEE0CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tl7WcqPDWUJ75eXu3pSQhgS4n2KPabqqAGURLWLLiOQ=; b=DuKCJd6guwABWS
	B4NDpvZPeTItb1kqjMAfvVi2ga0k6GMN9xxj55n+Wc/K6MADu2RXGJ3xGQKe8NDhiGBr+I/Ceo3at
	wR8by6plp61oQ3w51Vr6BPvIqIxi4aeEPukOKSu9NDWqFoE5UOCphFh5Ki1QJ3CIoU85bl9WhKz+G
	vSDJ6bY4hqhlRrJwx2eJ0vLn6uemg0TG1sj2Hb6as2U+XuP4dC7Jwqd+X4wVLCZedVBw8I87viaAT
	1fUj/dgttnWm9XcpPTVrMNwx9VS3VlhVOAO/zG3HxkyTmX9HirVpEufL7zrZte35o73vJkBOV3rlF
	y2cfDyVN6gyOwMCqsZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7CS-00000005wro-47HY;
	Fri, 09 Oct 2026 09:47:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7CQ-00000005wrF-3P5d
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 09:47:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d560775ca2so20031125ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539253; x=1792144053; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=r1sef+cyhCq6H/8NM1d0Ep+D28MJMJ2qgpc1dF+21jcDC/hSQDYGFA8gU1g0pxMDeA
         KTbo5YQ7S6J/3BMKznvaJcONSNkrGuoix0RQfB8ubSHITARVp1QczluL/ITFEMIeOEDA
         2PorTHmYvU6IYWLnPFImQb/G6gtPfHWKAzL/pDvZUGhHMqK2wNla+zA5KltQELyCP0u/
         Ph6hcXbSESGS+hoOGFD0mZ25wKwhkD4E9mCP1eA2Vg80zbRngJNviYhg18MI5UPR28wl
         Jej4fBjMvxaw0K1hc7YSuD9h3Bx1dGNzi6IaVKuwIyaNfHig8EbA8px7sDFyQuUalyRT
         nfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539253; x=1792144053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=OERL3W1fqdmqfjVcM1OMJuYD2+kvO62tMQrhdft+WJhGsF2oL7k5ZNp/CLtx1p2bWG
         ZszFA19AUE8HHv0Kj3+g7wNX4sgbRWa+D/KX0qjg/wPkdjWAT33qzkKYhSxO3OaNfRFH
         kXtF/gvfv52w7LiZEHVjUVrRXvF2jn6l+zKSjmKBGCZ9vAJAZMHYzFPtAnAyjM5pAHN7
         zh9GEliMhK2u7lv/SNmhhyjzaKgiHnRfbpXZZFk5yz1kJN/nvge7Nuu7YaJzCoHL9Zsl
         8TNhAKHBiGuNamCRlMfR2A3HcdpZhTloaLEo9isbhAVIcf1/7xnZPUvHlpzXQOWj0KzH
         BRmA==
X-Forwarded-Encrypted: i=1; AKwUvBylNga+Zo6Sdu0pa543/PECevCeBp2whq536Vp1XBSH8QO5LMX6MdhhQtfs3rxEHywvN3VGdRCcOwulDw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJexS5n/2DjbVnzCQfcfR+71G7GWCGof8LyfR5T9pRqGDqi4my1
	es8Khfpi8Jqs52gADNDU0BCDc3DGUTZPG8N9K9cLQ/b6JWiU7b59waLb
X-Gm-Gg: AYBFou0eY8yaype07leqUIuwBzMK7TQtnmS/vuMb7v2EWheGB1PF7TpMEHdR4U9ANWY
	VFizjJawoR91lQrGkI4FxU7S0XMZ6k9YB8CaGqWt91IUTZfwG3jgUJc/vvBcg0ifylT6VTZ2SrK
	jvJKgAIrZrWsVCsfuR8IVWz8pGSHIz23G2IWW2HGjlMeJXIFy1z7rvXEEQC589BcZ8Pr4XuPSX8
	edg67qTq2xou8+C+zcRC+lQpk2T7f8Jm3KU3m2bYBPQGNZkbqe+md5YivPWJwQtjMBVy1nlzOCY
	CwgSWf1w2xKBY8sHxBf7kN1Ds6YgUknB7bNbFhm/wXesHfPzRb+fXzRECl6FZktfZJtX1c+eTjE
	Y4PNwxdCUtUxwf7npLCGeJLSsqQkUD1FQpewe0fJCIbPlk4ia004ij9JfgiRxcWstD4yiPUwqkM
	ceekGH2XaHIsjUL4w0AL3QpL4xUm9+oBpVDT+ov5QTUqbRijZov4zyahC4CARhnOZZfJkM
X-Received: by 2002:a17:902:ec84:b0:2e5:d2db:bf57 with SMTP id d9443c01a7336-2e842d03028mr11541545ad.49.1791539253450;
        Fri, 09 Oct 2026 02:47:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm5963035ad.33.2026.10.09.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yao Zi <me@ziyao.cc>,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Fri,  9 Oct 2026 17:47:06 +0800
Message-ID: <179153921383.259252.13110307622319000120.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_024734_875161_4F161F1A 
X-CRM114-Status: GOOD (  11.10  )
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

On Mon, 21 Sep 2026 17:08:58 +0200, Andrei Lalaev wrote:
> Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
> the end of RAM. It is not correct because:
>   - FSBL can be configured to load FW into a different region
>   - if no firmware is loaded, the reserved memory is wasted
> 
> As explained in [1, 2], FSBL should reserve the region at runtime.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      https://github.com/sophgo/linux/commit/6645398c46219e97fd153ae6188ae86c493d2d6a
[2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node
      https://github.com/sophgo/linux/commit/60e4cafd30908e7d8cdfdb4fa1a74dabed9f47b5

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
