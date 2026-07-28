Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC3C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhirTR7+NTSQFz7tXY7+TFuP4qY5H3wT7+WU9xIH2KA=; b=bnEklNPYNBmBgl
	mXqcMXqaoPXefqRg80VaWuWANoXvqMp3xzkCk34HjaxH7fNT+kTnlTGt+xSLdrp+rFA8idwIqtdls
	4Gf//lqAM8SroIzNQeQhomHhEn9WYwhsKqqV2QyUIV+UpXvIdK206F0TD43lrChD5R+ujPX5JNhZn
	AZO0d2n7FEjhi1vE5pfQXL5BvEjcOyAyWq4HZU58YkehLw0XfjrYVk83J/t2hinj6H1PDmbb+NC0Q
	wQWOZVu2Eg0wMHtEtZLkJBhZioPv9xAUulNizNz+KxG4JLWAXXHIFSBqqxXCb4iw9twJScn55jzxm
	PdlAw5gF4mGbeUrrty9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogCU-000000056aw-1fr3;
	Tue, 28 Jul 2026 11:42:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogCT-000000056ag-3TfB
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:42:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13DD260051;
	Tue, 28 Jul 2026 11:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDD11F000E9;
	Tue, 28 Jul 2026 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238940;
	bh=nLL7Bco7XqVGH97lipE5mmHYcS8LVkm4YhvfVQFwzfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hbyY84LEvImMx0MKVZi4XR0RbVHDnnopnxg6ZJHEByTAT/kWAsT8RRyVlLSYJDHmM
	 pyh/GqG4oSHhK8a13Ra66nj26318wZwbJUAEf5uIJ9UgfwNT412NlEjCqNp8raz+ZQ
	 dKqDvQmcHA3qRZtF2aHeUoWJjtGSsftTQTg8rHJcxYpQturESLHZ3oWK7tvgbSmzN/
	 8XLIftSn+SQWCjYrFIU9Y6Oox+z7NcCUWMaCmITrWUJZgvTmtj26yZYkd9+NHyfveK
	 rxFKgUMLRhnFBrv6Kj1aeD/lqx3O/ptE/OaSbgRZFk7W54YUvg3gRvmvLEP/cUIwET
	 oU2KIdI8/gGsA==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Date: Tue, 28 Jul 2026 11:42:14 +0000
Message-ID: <178523890901.625561.17183698550548051286.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
References: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
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


On Tue, 02 Jun 2026 18:00:00 +0800, Chukun Pan wrote:
> Enable the two RTL8125 network controllers and corresponding
> PHYs connected via the PCIe controllers on the OrangePi R2S.

Applied, thanks!

[1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=31efde747b5e5d2c185e06d872a9ef9b87f505ac

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
