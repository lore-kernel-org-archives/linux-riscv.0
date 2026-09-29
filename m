Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC8BCA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fux585M+yhp5Mena5l+P3jH6Q+dJgUwjAEMFeRjOsK0=; b=ifC43lvrPOzcoX
	9bNMTpFoIlZu4u64aLq47+NIEMDByJldX+BaPQh9jN7gq2LhkySTor0poh6K5Q9BGQ2qtZYreVWcN
	pq+xId3E8DRcQocnE268o6N6BLYZEoTTIHR65umIMq3UVt6LWh0EGkR7xcVqWKPvJ3j2jxAzNGvZk
	CLQHscrhqaEgfGmpqfKe0JGc1IA7peiiew4sxwERzt3mM3dppCuYLmcxynvmqulmdtvWjw2aR/mhu
	cGDxaCBjgwx0id5SdvlkdbLbMz2ym4TozKn8wx04xfaDDConhMEffunuteDLh6/nbVGCkqYegjbwO
	VaWOISFTVYwKqLKQ2Klw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWlV-00000003VID-1AiX;
	Tue, 29 Sep 2026 12:16:57 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWlS-00000003VHo-485U
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 12:16:56 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 6CDE41D00146;
	Tue, 29 Sep 2026 08:16:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 29 Sep 2026 08:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790684213;
	 x=1790770613; bh=za2V7Z1tBaPJIsF6VbDgL/Gr5qezbehFs/mU6PCMXDY=; b=
	PaIBRIapCVAGkdluDQcWFxEojJvnJdqg9Ca+QokOkbHXr52PsbHitRM+QRKivAQ0
	/zhmW/xGI+yaYmqGggmo12VldXyoXEbi+doGj+7rd08Ay7gf5XM6J/60X6BEvSu+
	pNtrgplabhaqK+V5TK0CVjA98tnJRWxcXZpL6Oo7+9dZXYMNnOpkr0PlRT96DZ2Y
	c21KUm7QbzTIrmGiNBztBCub14McYmATgnuFtMPJm1LlnLGGKVXc/EY+iXoPayYY
	KrKlbF5jsTQ0MgpqaO71M2b+y7XqKE0PaqB2eGR5R3YKnyDXNUYd/bEJNbCTLokr
	nSc2D2XVv6xV3SvkUQpCaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790684213; x=
	1790770613; bh=za2V7Z1tBaPJIsF6VbDgL/Gr5qezbehFs/mU6PCMXDY=; b=u
	6itGouU1wWGOiE9K8Cq8xg4cz/nGiYoRf58dBJLi8IGrrsnpqqokbgXRVm11bj02
	JXXeqG7EWAA3MS+670Kf/BEYmhyK8WmqGybHmfTc1URv29KKVCfRRS5weYA6nxCZ
	dW0qwZEOjVx9v2wmDpe4mh0/JiTN5XzNdnN8KKkbjVQsMrQKjqdzkgJujPnhWu4a
	glgvBfzEVNvPcJizqHZ7+fp60h0EYY6hXjR7cpfP3OnAIODqIn3XGkOp5kgOIeLW
	m2SYw/vm6qDYd41abZf4MGktxo3i5kRtDbf7WlLd39D/Pu3o/x/PZV6pgJElrmGr
	JP2YXs/Ykn8Nnc9IhGfqQ==
X-ME-Sender: <xms:NKy7aivoPt-yzU9whJItS1CI_1wyQ5hp7CJe2u9fKp8m74W-tH6rNQ>
    <xme:NKy7apGDzPlMlXsNf8pU_PVzpkLWZdvzRudKAUEqjhS-c4df_FrYCzjTakmtE6AKC
    k8r6ZmnJ3_EnJ59tPdHiE0wBDwC7yXu4gn-6I4nu545opimiTN7cehr1A>
X-ME-Received: <xmr:NKy7ah0wtogCGUDWulbhAUuv9UnxKexysrLNDXeJd5E0kRG3a7k6fsLeEy6ymNjcjSYhBkkPrnW47hndoJuurzgn>
X-ME-Proxy-Cause: dmFkZTF3XDN4KUZZZUGh4M9PTDiqNBb6FcuQlMtMiNWj03/YHI2E605axOeGtO8rwh5R5U
    oc5us/7kkhAzrZKrZZ8cRKIL1vUnOYdO4qiciiv2I+7Sykz/YDZPm0JMSuOwEHYzbv+ykZ
    dskjQ4YYcfZPjbiUd3aRBIVeuTGp+yYQm2LXUn5SR6bndcKjmKYDyiw3OmOACZwcIbUY4w
    3aqhYQpyv5TTx91hjUvlk8VTogv4F3XRDRTm55mGTI8KANBTGlt6SMqBRHNjBs7osy+5s4
    tXvURwU71vt9lbPfGJ5ofHoqO0hRVlwUDKXOpgmbYBR3amM6bciBTW0uC6+D6IAFqURbe8
    5fBq00rJ2ITAl3TUwSblOp3P10/Kk0rXnMZAuGvxKeDpAWv+Ik1F+N6OdT189K2SNsGlrI
    RA+Yf49/1ZVtHc/bNe5+yr8NtBkKcrLTkjN5RKBTehwbWeiZBSg3F6przRU49Hy/m2oaLy
    GHRZ9qAHtLGf4gF2S0ak/vTGyg14QoGD/YvdM8IMpG1UURozLm7DnJJnlC/5uMbekgUK0H
    4QXMJufr0ngVx4170K8tzsyWnL8W7nAgC+9TJj2Q7UcbFyxjD+PwEPeMPCUtfFjlY9y07K
    JDwsUVujKtesuXe7FuVaV45zfgbXYkoY2EJ+Y2k8UCR4napQX/BobCzb6f3w
X-ME-Proxy: <xmx:NKy7ajoxmiu1K3uBw61eK0u2x1tHRffIYKGUuPMXjUg2PJW8IcwuEw>
    <xmx:NKy7ah6uU5SxcBQ8Ny05L3a4jNpPE50YByMG3k2pC7rpqTpweTV1vg>
    <xmx:NKy7ajwKCeC0g4ccpGHm4OgT0TNtk8osfPafSTgMd3TFRWztw_w74g>
    <xmx:NKy7amBUh1Ji-tVmmlxkOEQyEnpRbabMiNJgkFPcPkeOgsHtmjNnlg>
    <xmx:Nay7ai_psFI0GgBbcLrVnJuH8K3_oavvPctHcEOelv_qWsHH3CJB-UgA>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 08:16:47 -0400 (EDT)
Date: Tue, 29 Sep 2026 21:16:45 +0900 (JST)
Message-Id: <20260929.211645.1865853879579118631.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, ojeda@kernel.org, fustini@kernel.org,
 guoren@kernel.org, wefu@redhat.com, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org, ukleinek@kernel.org,
 m.wilczynski@samsung.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72mRRajbvJzwZZzaMiG8UQT1yeHn3Cm1+MSg0VqLT22dVg@mail.gmail.com>
References: <20260929095612.1072417-1-tomo@flapping.org>
	<CANiq72mRRajbvJzwZZzaMiG8UQT1yeHn3Cm1+MSg0VqLT22dVg@mail.gmail.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_051655_195985_3AF3249F 
X-CRM114-Status: UNSURE (   8.41  )
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

On Tue, 29 Sep 2026 13:54:05 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, Sep 29, 2026 at 11:56 AM FUJITA Tomonori <tomo@flapping.org> wrote:
>>
>> he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 
> Cut word at the beginning.

Oops, thanks.

>> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> 
> Should this have Cc: stable@vger.kernel.org?

Yes, I'll add Cc: stable. The build error has been there since v6.19.

I also forgot to Cc the PWM maintainer and list, and missed the
Reported-by and Closes tags. I'll send v2 tomorrow with these fixes
and the Reviewed-by tags from Andreas and Gary.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
