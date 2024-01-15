Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FE1C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+1kysbLUObJw1gCBtrzs7itnfK52yOEuxGdj4N3u+k=; b=HpXIaRRcB/1HPM
	U8YdzKyc3wQrftk1DIUXbNAP+oHJSDrhY56nfSi3imeQLaCubzFTdV0iHsLWpCnlpXCka2quLcmlU
	gnswBDHMilXKyDCIyffAHBHGODIabL4aJqhIralxtq4ATDJFSYVbjGTAf+7/t6aR1FvufwHUkggge
	G5mdEDWjk5FaBcWIYvO0lFaXkfevCXhbMV6CXsd9Jd7K5tf/iU6QG+9DDJ+em/vQglRBTdlSbkinI
	mLq0JTljakViq9BYq315DPG8akOOZQmqfEdDOlM2mPGHDhkdP3TDo3d6NZ/qujWWQ/rnR9Uf638Ka
	Bp2LF/cYr1FKWqZNtTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP5e-009RoW-0a;
	Mon, 15 Jan 2024 15:41:30 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP5b-009Rmb-2y
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:41:29 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a293f2280c7so1043719966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705333283; x=1705938083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IoPBd+9cqFRLXfeae6ug1abvNfzBQzrAtdxiFLBULy8=;
        b=eZWhYFmyr5JHT9bNDTyz78rdbyz7owIrdGc12LkbnihaFiGFDneNtu4IcBWbSibxli
         3Bszvi57iOJvZX/KtIGmiJwn6o3XlW2Ak8WZq/0vGt2j3yKn3J7N8Hs6jM6yAJBED/YK
         SlJ5UKkx0QbbrvMWwAswvJYW7w457I+o4hfnvIPgTo6fW3l8Wpjdz+agoDGDMMzxZuvh
         6LprIqowqTqj48D/TjgNTlZXHk7kJY1zGdZbw3YHsXC5HAFeF4nakWPQvMarrLFnIZ7V
         tNppIjRr7wWJc9gtJzhyuAc89aobhCgZY9alA/JrpyxR4XuIchAahg0aj/03Uof3ewFx
         8hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333283; x=1705938083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoPBd+9cqFRLXfeae6ug1abvNfzBQzrAtdxiFLBULy8=;
        b=xKrEY46icJdK4A+lCcaoRNBlL1ZxvIgq8i2Rl8Flp96FCWE2L8CgMMdNH30fmq4Vtg
         TTTkrRudHcI5vbHOglHhrcvJbWK8ijBCTzypSt0gfxEL+XIQXogRO0kRF35Deo/kXDXK
         TChtwlJ5u+7AL7IhyyCZWbcYfkQluBEYviZv4NSnvsHIv1DN9FBkkd9itMUxu1mplGgM
         J29ArtG4OKXDq+DbfH5AwVw4O6o5kYunvX/IQw6jaHijIIpM8ad8/J3tG0w0EihQBFay
         k6V+LrO/F3L6EC0VuLLICv3Mr3iBPbTCJiIoMfHyoOp1sRnvwC07V9dAv95FWhNT0QRt
         XyXg==
X-Gm-Message-State: AOJu0Ywn43XOlra5PZUj+hYaGU4JQGdyQdURghBkAQBkp6qTQLMOp0Af
	hhyCNkKGcGbw5uTcrhfj9P6AOt5/6Rec+g==
X-Google-Smtp-Source: AGHT+IFKkPeCi7wmzN9qV4FM3v9RTTO3ePVJwXYR2KVsSk7g3fKbnojc19QbqZiEL00Tk7sLG0iIGA==
X-Received: by 2002:a17:907:20e3:b0:a2b:2615:25d1 with SMTP id rh3-20020a17090720e300b00a2b261525d1mr1367400ejb.90.1705333283455;
        Mon, 15 Jan 2024 07:41:23 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v24-20020a1709067d9800b00a2a4efe7d3dsm5425091ejo.79.2024.01.15.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:41:23 -0800 (PST)
Date: Mon, 15 Jan 2024 16:41:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/15] KVM: riscv: selftests: Add vector crypto
 extensions to get-reg-list test
Message-ID: <20240115-8ab964d5a932bc2c5d9da188@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-8-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_074127_956529_54898195 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, Nov 28, 2023 at 08:23:49PM +0530, Anup Patel wrote:
> The KVM RISC-V allows vector crypto extensions for Guest/VM so let us
> add these extensions to get-reg-list test. This includes extensions
> Zvbb, Zvbc, Zvkb, Zvkg, Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh, and Zvkt.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
