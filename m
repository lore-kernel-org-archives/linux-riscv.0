Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40495E7849A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B75RzH73Kqds9OYvAUi7KjOQVEjWDviEArKK3J6qT8=; b=VS22DOHIXFt1lI
	UWCNtCxET51cobiHrpPswkj4sZCCGBWbt0Vn6QSf2asKxisYzwajQ+9J5Bph+563D3+LQqb6ZZ66E
	Ktu8aImitumimqCuUmYJVR7/VieKrgclIiBw7n/D+6Y4mPcYJ8Y9/mfyUYunzgAIQIX39lLabQFa8
	PASM3QybCwpdNv0KjjT8KHjbvemLQ0OByhYMHVZpycRqx3NTAfPaajEORAfJ9W2Z/mJn48jFcKYcs
	JcjJyBO7CzS63RIleyACspDjnpyFvnhvXrrTWmubQU6LnBO/CZo30s3qJ53MEGCH5dYfDKWDJhldY
	cBAe3N5ZzMItK/VJ5mDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXez-0000000HTDC-03jK;
	Wed, 24 Dec 2025 22:48:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXew-0000000HTCm-1bzO
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 22:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 535EC43599;
	Wed, 24 Dec 2025 22:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0559C4CEF7;
	Wed, 24 Dec 2025 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766616524;
	bh=pnbvEwGNI6TF771DkplCvslfTR2GTnABbOrBdwuW9ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdKQ2EGzHz8Ri2yX5GbdjVSKBN5zuYqZSS5g36vxHG6JCjhm/TIL9Ed9IK/oNvomD
	 2fD76805UH+BLl4bWnPsJZ13W5V9TZosoHTw9LbdD+RH2FjY3Vz7YHLarrF0AGoWQw
	 IupS+jG/z+ha0W3TRIrbxIfu9cS90u2KKpDLRje62IcK7jX61r+ZW2/2gOJv1v22K9
	 ijbB1aVC4Nf1c6SmnrcqUn1ALm3QhCaWWnP2iY7wCWHc6Z1PIuC3lwGTdriUD7Bx5O
	 bVlvBlM+Xr0zA3x4FUB7JUlx2+HYwYUw0489jR8x/dlS569DKqZipYkZrDIn8Wf8u+
	 6dbU/gB4sX5eA==
Date: Wed, 24 Dec 2025 14:48:41 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] RISC-V: Detect Ssqosid extension and handle
 srmcfg CSR
Message-ID: <aUxtySYYiAk1WjNt@x1>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <CAEEQ3w=3pte5=CR9-R3rmCGFZ9ErJ9YcWS9i=JwPUb1Ty3ipwQ@mail.gmail.com>
 <aOmA8DNt/y+WxT97@x1>
 <CAEEQ3wmHH6=ZNCEq3hV6Cmf7gGd0kZsH-3VYr6awZmPCz8h_cA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmHH6=ZNCEq3hV6Cmf7gGd0kZsH-3VYr6awZmPCz8h_cA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_144846_446939_B13FCFBE 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed, Dec 24, 2025 at 04:40:26PM +0800, yunhui cui wrote:
> Hi Drew,
> 
> [3] https://lore.kernel.org/all/20250910204309.20751-1-james.morse@arm.com/
> seems to have been merged into the mainline. Do you plan to submit a
> series of ssqosid + cbqri patches with ACPI support?
> 
> Thanks,
> Yunhui

Hi, yes, I plan do that by the end of next week. I got feedback on the
kernel Ssqosid series that I should focus fist on upstreaming the Qemu
implemenation as there is no public hardware implementation yet. There
was a lot that needed to be cleaned up in the Qemu patches and I'm
finally near the end of addressing all the feedback.

I'm about to post a new revision of the Qemu series and then I'll rebase
and post the kernel ssqosid+cbqri patch series. The initial series will
just have the DT-based support. I plan to cleanup the Qemu patches for
the RQSC and PPTT tables and then I will post the RQSC kernel patches.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
