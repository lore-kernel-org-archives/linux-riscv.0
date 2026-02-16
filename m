Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4CEE63F2A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 04:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sxyb+Dsx1MqSUExhMp/zWl4q4WyJDH1JUVP/ik9QAas=; b=qP1uWqj+iCiD2F
	1AA/azdJfXJmmgPXiTYrk+f8Tpw+hxw9ehS9cfARK9NYpEWhYXiU5zAlXKH00HXW0LHZQLKqSbfLc
	hZ7Rh60qsD+glmBCcV21sQ6gCYQc9huhIStcoV7ZMZ2BFUG0SdR3yyqQjfEnckrCugQavSCPXijTb
	jsk7x3LYjo36+NH7Y8qm0vTI4PmGw+LFWidJRv/M54Dk7mdzG8citzUEKGimLEpe165wBTK6yKETv
	jdgxbox0JF5guiuOQ3CVeUnXRhiO9798ZZevoL7Obu16GYySqz2TLfGbD5FZSZtYR1iAgEyQTkeUn
	JIhyYS99e5dezDbQHW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrqPT-00000005x5h-27Mr;
	Mon, 16 Feb 2026 04:40:35 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrqPQ-00000005x4m-2Oro;
	Mon, 16 Feb 2026 04:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771216819; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dws1CK1Ncg9xfL/bS9uHyb+7p3KS8L1uqY7QMUaOA0sMjQCoGnZ5ioWSEuNNOf2TbnDg1lw5x6dGXe+QExV7XBvL4moUTYJL+ty3pbEB+O9pOvV7ajEKzsovSghr/7BLAymeY02Pp1F30+O2uNkmGDY8u+i/+xStD6VkJcGP7b0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771216819; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E4yO3rtfux2YLjw+kJJwbVUfdaJfx7vt8Qi+ogorLoo=; 
	b=PssSJJmcWSrgvJU4zlJ4vTHv+I0gbVHZ3AL7AuQ7nVdlQ9kk6QnIqP4nWG5+usMK/cslDitSjX7wnfcKha4Tfj/p9Vv2TkpTEJ6k6cB7jniBwGNSpQgpkjM2SQgYsPWQvgiddoy6qZh/ZqNJOYyh9FBjjV2Xrxm7mJZuUT3lTEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771216819;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=E4yO3rtfux2YLjw+kJJwbVUfdaJfx7vt8Qi+ogorLoo=;
	b=G4dlI7ufZwJI2frTfOUFrNS2HUXmxpcCrDB19BiMj3NUCN6NLqqMhJQLkrm0QQvP
	eYGWT9WpT+Ctm5n8207y1cStIYIwkEc4WscNjcjNiGdWPB3KNF4pp6l+myEw6TBs88A
	cclrcxZn2zeS0zsNzA103SmaqJfXpJgKHe8+Zbow=
Received: by mx.zohomail.com with SMTPS id 1771216817194335.9362570477522;
	Sun, 15 Feb 2026 20:40:17 -0800 (PST)
Date: Mon, 16 Feb 2026 04:39:59 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <aZKfnxXrYVXE8oP4@pie>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_204032_688841_0264BA16 
X-CRM114-Status: UNSURE (   7.52  )
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

On Sat, Feb 14, 2026 at 08:29:16PM +0800, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Reviewed-by: Yao Zi <me@ziyao.cc>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
