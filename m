Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68847C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IOwF7DKNrHePQlxUARso6m+gKQAT/sqcIG3EMlAPio=; b=zkt2mTQA7VpSAd
	ggoQf65z2lzd/jHnWDxvn7U1d3KqF0tYIJ9SqQJGdDHGRJpX5cR40p6qOyY0aQHBf6/xOLjObEguj
	JHZ35+tvzm7RWa2zHcKkmxxH9j6gqPySn0nSoKnrIrg3V7EQV0YpjlGHZgfkN7/RO+4C0iy5/kUq2
	VfDX8xIQkAMScF6GP5WWGtHgmzZmmWtan7WmtwUQLADsTkLM8/5npPE72z6HLRbqVnRAjXgxJpKbf
	t/p/wdDNmJ72vqB4+vpWblzgWJ6h5PXKMC58rL5sjua91Lbrcighqs4gNlOisjPHhPw1jrZT2+wPx
	HUkVlb44+bbTEWi9FtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKto-004l4r-16;
	Wed, 16 Aug 2023 18:05:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWKtl-004l4U-2u
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 18:05:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E0C06343E;
	Wed, 16 Aug 2023 18:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7590C433C7;
	Wed, 16 Aug 2023 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692209136;
	bh=JQl0mn2XbpDCEfJ6yKECy2b46XphKoK5Ye0vfvkPGyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+MJsvU+60YJXTdsqr3/24XqNkK1HICJgFUZnAryhRfsU4blmqty/7M845sHTnEY6
	 /SfkR3u7Adw5zyN9l63r+fuLdiTGVczt6eifAzPqLEhPyUMUP+x3k+16RfcJUIRhV+
	 t+mOINXt/KIxHqPdHDfBccJy5p0QuDZpGByX0koFPEgvT9wnMXSJa8NEjxSjcXBDzk
	 bwBrdVakd0wr1M3HV+3veIcMxFyz7PcvXyKQ+Kd9Om+8UdZKSAa8QXUZ6OxsfU5XD3
	 83k72thMAWeK8FpXBxUXOEmZY1VUzrKZjCs9TGTBloY0n2JdrQm4N572nqtAnRBuEI
	 24VdYoLEs1TAA==
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] riscv: dts: change TH1520 files to dual license
Date: Wed, 16 Aug 2023 19:05:28 +0100
Message-Id: <20230816-feminism-catatonic-e7ce62ef85ca@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724182129.843687-1-dfustini@baylibre.com>
References: <20230724182129.843687-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=307; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TQJs0EVZotMHGriusZQX5DXuev+izxQ2z84pDBNZFLU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCl3+Z8rGc1aNHOnZ9ukbblWKeaPPku45uhk6yh6caj0c W+9rVHdUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl8DGb4p1SdE/evKsOws1xF Iowpd9q7rx9+TG5+cN0kz/qIu0z1VkaGNToqCYeW1Kg0nSqyskvP3bew+YP7VndeC2/z9ODv3HM 5AA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_110537_980582_4E73D3AE 
X-CRM114-Status: UNSURE (   6.92  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 24 Jul 2023 11:21:29 -0700, Drew Fustini wrote:
> Modify the SPDX-License-Identifier for dual license of GPL-2.0 OR MIT.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: change TH1520 files to dual license
      https://git.kernel.org/conor/c/a3ce3ff28385

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
