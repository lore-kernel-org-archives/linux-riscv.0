Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8125110ED65C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgJ/Qrz+eIw03GRWpwFWl8xBNGXEh07jVnZAT85hvd4=; b=RgohT1FulWA3xL
	7iySUXo9WPOib29G7AR0CPdoWdoYTYK5kn8jIeccEOftCJnzKHkxEldBc2ogR5hy3jtEqQolHqPy4
	eZWeRZluGnJgG5dQJCm+z66fQiFEm+shyYbmfg1FEp4re+k+OZQ6Int6W105jMHEIhWJBdRjwczNC
	WgL32YdR9y7Zwz7dcF86IZ8iOAoKEkVkpifYtjRBRTMXroqzQE+u5/Cjb17YJir5av8Gg43eK2IcS
	i8lTFtU8qcsmCcdIwhoAmYXK6G4OGU88g0pMXyo4xFycf9/Av7P7XOj0Rd34XD0krkTC/wrOyc76i
	JXOZoL7/seqFPTnbLzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65WX-00000007HQ5-1hBS;
	Fri, 27 Mar 2026 11:38:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65WU-00000007HPn-1bWF
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 11:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3E1E44078;
	Fri, 27 Mar 2026 11:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E33FC2BC87;
	Fri, 27 Mar 2026 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611521;
	bh=Y/In3PPWyQ27YKVvZDsM74MTjLC1TLqYi8sV8yii7hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWp5A9/fpHSziGYkCt5ZPaYh2GcjqYjJbzIJpxj8pig+NeiG4QLZ2ol+v2i/ptX3c
	 v6gXsbdfByn9pHS5pCLMQuztdK0C7Uu/bNPwRDcFLHr44J4PlcSsVx+COaNlZ8tWZ9
	 074KWXaV/7z3rV59/fchAiTQmp7XhiJTDk+0QDqPj04BniRLsqy1+wAbG21L0IyvDQ
	 1gEbalwvdi6oCKiPD0s5Xy4pBVcI+XkEiPVdqEipNw9TZ+8f0NRaW7CntCw3VqrN6s
	 iNok2lb+MMF9MIG+YYw+07aCR/TuvLbH+/4Gbb8pp75xXkHYc1FFHJI6naYW3JsKjx
	 UQ0J2YYIwL2EA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v6] riscv: dts: spacemit: Add ethernet device for K3
Date: Fri, 27 Mar 2026 11:38:31 +0000
Message-ID: <177461143950.339028.17970705137917996650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326014617.1011732-1-inochiama@gmail.com>
References: <20260326014617.1011732-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043842_440035_E93BCC18 
X-CRM114-Status: UNSURE (   4.48  )
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


On Thu, 26 Mar 2026 09:46:17 +0800, Inochi Amaoto wrote:
> Add all ethernet device nodes for K3 SoC.
> 
> 

Applied, thanks!

[1/1] riscv: dts: spacemit: Add ethernet device for K3
      https://github.com/spacemit-com/linux/commit/74657a376960252e248089e518cfaaf813906989

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
