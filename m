Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59AFC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceD2wek7KzkYp5jtKdlPpwZ9wR4AXri/7ayAklDhrvQ=; b=D0MU2cSEbmHCM3
	hvh4qmnlluTPB15KV9rrky1SRBrbSNmWgzst16llIdThWtHpt4L7engtZa657eRV7PwVpmlYSCtGr
	uv52ek6uzh1Cs/lXRf3jZ5EncebeJhpc2E0romQM93t4k7HgDdOxXQxSpW7P6omAR1nFLdsF6KHkI
	ueIKy4tfwRekOn9OVpwxPvQxKhK82z93jXMhZoMRnzRKEgPXEIwsaurmjFuNTvQa0RLEHsT9kBWDM
	ewRznrVnbZl2KyFv/qM38NVI44j334/TsTAtUnSNgdqLFhPOk0A1/iheEV/kJ6QrCsirXCWU1P5kg
	hlIgS8z7j50dFoEGWYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW4x-0000000A4Uh-41wU;
	Wed, 27 Mar 2024 16:24:43 +0000
Received: from fhigh7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW4u-0000000A4Ts-2wPk
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:24:42 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 35B2E1140164;
	Wed, 27 Mar 2024 12:24:38 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 27 Mar 2024 12:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711556678; x=1711643078; bh=fdt0R9lStJ
	8mfdJYKIs6B7xZtVK2mxT5Rl1pe5p+Hik=; b=PXVUiX/pq9Y35PYlE8mKVAEzBy
	tGBvQVWMdfylmG0RXDdVIg8YzbhSv9deUbwUFgCqUXeSU+q73W08XcJwgKaLXXe0
	MbsngyksrPKUGVyJ3J3sXhRRwfoSkH+6aBFRMOwMEKEqA0Cp+3fn7ljxgLvmlJQ0
	m/AYZ7Lbyk9EmvoUbahZLB/UdXtIngo158eXbIg8KvL5O5qj66x8IaaFJLZqvBGr
	as5uAvF51xhnoFNxUbOWPooSvIsSDXphnj9Rmm/wUF8BsdNn6IsDMARMW9LW7jHw
	w8IohPhRjqZzTxrcTUCFR2wsEIehTF9tN0tN2j6E+B6K2LQVfkatdW9hnYUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711556678; x=1711643078; bh=fdt0R9lStJ8mfdJYKIs6B7xZtVK2
	mxT5Rl1pe5p+Hik=; b=Q4PamvyQ3XQ2dFVVQGAnrcx0rXFTTHfaUrQW9QMaL/r/
	egqAD4IvvIz0S+tztS4FzCXpaGuoGzl5qswSXlZ7RGkVDrpvIKMEej49rRm02JWi
	psZGkg0nLQ21xsraQ/fjdWPQPOL8ZHAhBtZt4zuADrsYfQU/Cob45NzzbE3gmOFQ
	tLMzgIjoF2jlRMVpvPXXHZKi8zwSlFyvVkH1nSU1xe0hR9MveqdPNfgj5AtYN4rd
	V4+1JrCd/LSASPzBuALH5Phfa9eE/AYJFmUh8qkKMtCGiKVQ1VPkpoPDVk+IWoxc
	kNWfvd22+OKD1ZfKUwDK8OznPdM+Yc0ZONgavFFceg==
X-ME-Sender: <xms:RUgEZmUP6S_VvTKVEjfqfV-w-1SRc-4tVdG-lUf8qnwNJV5a-SjbVw>
    <xme:RUgEZiloItnnSkoAaEAUbX79RvrSbTKXxDn5qDPtB4KT8r-4l4pMW5jGzZQhO63IU
    26iTeyXOuuwYiDmZrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduiedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RUgEZqaHZ-h_lYI8q0YtZP917NdDzgHOxR3kxqnm4WXCczvOQOXUeA>
    <xmx:RUgEZtVR3z1bPMSMekIt-gtU_nBlv07MoU6Cdmj03ZYsGXSV_Thngw>
    <xmx:RUgEZgn6Ol4sMUpwQy5FclfXM19kCkevDF-mUzNes8s72YDuuuPDPQ>
    <xmx:RUgEZico8-oTKyDugJ8TuWAnYpFZdDUauOtVKMeMBrpKZ3PnLBxkGQ>
    <xmx:RkgEZuYXfYHSPj50EBYkTKhyGiCUAUGtK-jz-ZYpIyjSqqmtxqLUNg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 92528B6008D; Wed, 27 Mar 2024 12:24:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <4d2fa4cd-4e21-4504-b29b-cfabe90693aa@app.fastmail.com>
In-Reply-To: <20240327143858.711792-3-samuel.holland@sifive.com>
References: <20240327143858.711792-1-samuel.holland@sifive.com>
 <20240327143858.711792-3-samuel.holland@sifive.com>
Date: Wed, 27 Mar 2024 17:24:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: "Mark Rutland" <mark.rutland@arm.com>,
 "David Laight" <David.Laight@ACULAB.COM>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 2/2] riscv: Define TASK_SIZE_MAX for __access_ok()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_092440_824974_2F5B456D 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, Mar 27, 2024, at 15:38, Samuel Holland wrote:
> TASK_SIZE_MAX should be set to a constant value, at least the largest
> valid userspace address under any runtime configuration. This optimizes
> the check in __access_ok(), which no longer needs to compute the runtime
> value of TASK_SIZE. The check does not need to be exact, as long as it
> accepts all valid userspace addresses and rejects all valid kernel
> addresses; well-behaved programs will never fail the access_ok() check.
>
> For RISC-V, which requires all virtual addresses to be sign extended,
> the optimal choice is LONG_MAX because it simplifies the limit
> comparison to a sign bit test.
>
> This removes about half of the references to pgtable_l[45]_enabled.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
