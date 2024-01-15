Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8576C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqGgLKw1uE7BrH4DzwXfS4HpzcGU4SGzxnQs7kSlnPk=; b=kbLlBfcSSpMkmt
	7h+ty+HtIE/LV/ZBIPZTGWeKTWqYojkKoz3Ijtv/BeP6Kz8QooaFSpxxBOQBuMSTxDdi4V8UxaN27
	AVDl70tBNU15ZnT/is04kPyw/prLRszhQgjW6pM9uVpqQQRs2JxVji3V58+z12dQDdrRoXh4MF7aD
	QSFJvKe0N4ZoL/fIWukErqPoQpKBlgV1AGvnu2fO8P26vWLy768NarPExvY8fsG0tXjb/d/4QuYA1
	XOApZe+oA4zYg+0Y5sfxViKdmqW6MgxdDrqQwIE7xnqPUczoPJ5K+IoD57a6S4bp0eFLcWw+/wiUO
	oO2Jxzt65M53i7nJ6vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKh-009Vdj-0P;
	Mon, 15 Jan 2024 15:57:03 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKe-009VaH-1r
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:57:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a2ac304e526so844334666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334219; x=1705939019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vX/n9ayE2TXqBTrzpSAo/ZCKYm1wOZhICLqQ9+eiCg0=;
        b=fao4GpI0c49fBsIbSyQBeXmX47iquSj7Jdz6J7rFj8VoZEs3osHKGNXn0Q0xRrzX8B
         AeQa9Lqx0Gt61l1BiX7Y34IRmiwzpbzL9rpXCWRN19akVv9bJGFONmUxqcXvDl5WX880
         YXr7bDQhonxMEIXti08BevfMT7yO+8bcs1NVl/PBcQ0q7aSlFZkMwSDIvp/6GnKx7Bae
         GyhcR8aR9sqlX4Zaat7odH8O60q6idVjafrmfPhW/RUobyvaFVnCYZi6pj+/nYRvT9pU
         c6aJI170pg4Vr1XYbfwyq8/zx5WwumdQZgjJEoP73KE13JDe0fZp9t42mkpsmmfUW2dI
         2ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334219; x=1705939019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX/n9ayE2TXqBTrzpSAo/ZCKYm1wOZhICLqQ9+eiCg0=;
        b=dIjbxZXCsCpD8FnIJTiNabHfGqkhGRWHu8JsWbncZNlaST+gGdQd64i09czb9/w24H
         Oieh1aQNZey9lIgkT3tc76FJSfd1y4GltLgS+EDuV8qMetw8TAbuShCmgSE99AhKJ9MQ
         DKEfbMZRcExNkrbnGO9AeE8+j8gve/jTByDonFi3Am7a05/uJIA4x79ZzA1L8o6sZM/d
         kPwg/HR837HMu5ou7+FCoVZS2/Uu7RvakcMBtPZ/esIePtxEv3xRRrMPu1OsQFTTyrBZ
         0guJkYiSUzCnxo6KznuvM+K0fxTr7U7/YfIvKACLwjYzjeNbHEUx6FaczN1MZkLsoSv7
         /RJA==
X-Gm-Message-State: AOJu0YzjzDydejRiClkhT2FO4SQWQG0hSKS4slRr9QaCb9UC0EO02TDG
	AmkXE/uOlxjYmOQO0LqMh9vp+g01xPTcHA==
X-Google-Smtp-Source: AGHT+IGdCRPcSDRJJcIKtgclsrVYIJsy6Yo/XSgDHXRpg8VrxKkmosHcfX0XNK+DXUF44lI/zci4SQ==
X-Received: by 2002:a17:906:d116:b0:a2d:bc64:52f6 with SMTP id b22-20020a170906d11600b00a2dbc6452f6mr1002925ejz.37.1705334219207;
        Mon, 15 Jan 2024 07:56:59 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e4-20020a170906c00400b00a298adde5a1sm5395663ejz.189.2024.01.15.07.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:56:58 -0800 (PST)
Date: Mon, 15 Jan 2024 16:56:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 15/15] KVM: riscv: selftests: Add Zfa extension to
 get-reg-list test
Message-ID: <20240115-31d643f21351f2fc9cf833da@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-16-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-16-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075700_615656_19332D84 
X-CRM114-Status: UNSURE (   9.79  )
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

On Tue, Nov 28, 2023 at 08:23:57PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zfa extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
