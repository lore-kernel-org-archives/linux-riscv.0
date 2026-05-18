Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFCCD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 06:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJI2p95HmKOU4XOU2PhFpQrW1L2MtwcKEQKRHxTmtZA=; b=EtOAPgkbQpiAz4
	W30ot7s/tJhVcxiGjRpLsYxFEMOT7c4Fc8NEvAMAMfUUjByilbmcbDj7DBVhPaEum2AvB9OlZ36TX
	0kIpbZhZlPVPiIO6ZGAB1Be+7zv5Jh8v4Jyf9I3qNO/JTR5ngDM3v38FEITf2J80q5h+qcfC1AX5h
	+kH5W3bfyBfUzsFYmtszRoYe0TyLRQfoVDlvCK6VI5sVVdTgFDK5Tcal5jbJv8PlpYrDmIOk8Jbpu
	v5j/8qlXRTq/TrnqX+Kuko8DT5LtTT9PZ12rzTUa+aZrworfrO5a7hAO3OCdEMRw3NN/Wd+R9X3kf
	8i4r3ZXVfmqIUH02Yazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOr0v-0000000EN5f-3gJC;
	Mon, 18 May 2026 05:59:41 +0000
Received: from bg1.exmail.qq.com ([114.132.79.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOr0q-0000000EN4l-3Y6d
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 05:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779083937;
	bh=ZBo6UzpGi2/48ish2J7eO+3r26XLemO1MJ804jDcqVQ=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=SE8NNyjAbpjbvpghfI1tDrt0qParybV88H9Dw8OpOWZQXsjtAgj+3hf64OgrRSsVK
	 PN6XasHMR87YhOvkX81OTPocT+IK4XMiAkhHvJbhbkBZnaeURb0aKtW5CIFVUvWP77
	 u6j5H3izlY1JZcNYNtK0lsidGfrrRCOCbB77iIek=
X-QQ-mid: esmtpgz10t1779083929t26c6620c
X-QQ-Originating-IP: gvbpIGWnr3UB9vTsa+lepJJScjkrVuXQnqPryEVy31I=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 13:58:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10797554963980711834
EX-QQ-RecipientCnt: 17
Mime-Version: 1.0
Date: Mon, 18 May 2026 13:58:45 +0800
Message-Id: <DILKM8GE0NN8.3TSFR8JVSIVHM@linux.spacemit.com>
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Brian Masney"
 <bmasney@redhat.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MavvAJs3NvAh8HafFBBD7IJBCUCyaM6WDFBx7A6nMAeaJWnDnqLGmAI8
	Yu1nGggidzxqG67m9eO9HCEZFCvyrFphhcHJ6g6MdVEzS27TndSgVVc5+E+erslFSF656zR
	bzvTfSzU6e3qsqXZ1dne5iJcsHAiJLOIYsFzwMo/IhA/W6CqQgG2GbnxiodX8UyG+ocdIij
	eKr3ih36WDLjNQe3Y/ocgNijqVhGTBQV+0Z2jA3oX0TYkjBygbIubKQyeHq3weSansfHHQh
	C/Tj+31LrLe+QTK/p9UOMoC6CIT99wLDJ+mAH8gFK6EijsRWZFEJdOT5Z5i3HEsdBk7dIyq
	vAp6iGv/SRttDyvpQt6uou2+u2VcRp+iPUB8RVj0vKSDrPxf7Qh2h1HhrI8zxP5mC8FRpXf
	NJqq1ZRjRcZrGL8NYroG/8GH/EY1LWLWm6q1r5kHlCGZoHBKavlNsPzO8FOUIqQpuLZwU4S
	S75UINY0Tzi7WI47MMNYECwKXnxPviiUJC0wW3Oh9Za76avCn1goi2k1kWn7qlEPRnBFkuV
	+ZyXGYw593AGrs7WyfyKtthKBt5KQ+/1dj+frbvM6i9Uu7p9HJyKH7tjERwXcf6ij5aM8sZ
	zsO2Scrxwssr2quGrSd88d102gTMZNipetgHpXVpORRo732qytC6SEdGtThhOhDsE50XMuC
	Jcv8rfotUwU4I/74TRmFcRYkdChEkRUWv00Rfv22o07zE2ZKVlZQkh+hmkZp4cOCnPb7Kq2
	U7okTsrvASx+5jc2cfowvc78QZmSsrYPK0UnZz8ALj7o4uNOR8pjy5xkwHmzVY4NtjLbS+N
	rOZiO80gP2eR4DSY1z+a00b296V/afyq7J/A5Smdk6YIfmbK/7gZych4Hmfc9ZYDfRv3gOC
	bbqoE/ytef8VhsXXLvUqdx2kAtC8kzw8/PRbrg8tEkvuO0AdT1QNuS2Ti1X5OAhu1a1+ykL
	AiG5RQ9xAhmHeqtOdxN6Oq7f/og46FTCR62kphzg7QXAV6962qNGsaTfx3WR5Lzr4DwvMCM
	K6p7ppRuxpX0v+GB92VXpvycw9Me+tPMZtJXnLMQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_225937_586394_7263F1BC 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu May 14, 2026 at 5:27 PM CST, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
>
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
>
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
>
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>
> ---
> Hi Troy and Brian, I dropped your Reviewed-by tags in this version
> because the implementation has changed (to use GENMASK()) and requires
> re-evaluation IMO.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
