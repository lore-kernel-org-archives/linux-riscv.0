Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E6EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo2XQxhWPPOAUKukdDFx7sHCAKeiRXjsoWRTVl7grGg=; b=h75sSxpn7oy73s
	LaHPLN/R3ZrMoj4BAYfcrcatVsoTKYy6gufoBoMCGwp4wVthg+giAAwwQhyytUK81fqjNtyA1w+zC
	ZhuCW+Znxux/indmUojduk0OIkrllUY3mpl7N7NCJYBMDTZUjvayKNghLXjWi8ABFex7BMVj2znd4
	S/SgTC9WIxPaJ2WZmLCOZjIS/arguPIWohzOznfIGsxfMdRzVmpCdTLWlaXBEp8rdgQ8aaKTu88s/
	Zv1xzspF2Myg0jgKsg5N3CIOXynDc4+DuU1bRhn+wruTgCxkmAnmvjjuwvcJGEwlVSOvnJXwxO5la
	wWKpKmo41d6o4mpDRYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbcb-00AO6H-1h;
	Thu, 03 Aug 2023 16:56:21 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbcX-00AO4b-1f
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:56:20 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9e6cc93d8so19116601fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691081772; x=1691686572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qEowLIfYXc6RIyRT91PkflonDDx/X3GfoYD39DoAO1A=;
        b=UxsdCkBg1bcFlErPzGOaMvsw+uZ638VKGAjxqZsrPcmWnR91jIz7QgETMyzZjXdybV
         BYeoKm+M+VCC8mXrVkehOS0tMpbtFTuZBDk4pzAbsyWvIvAuRYpvmKtH5iXZpFRMm6r0
         C7X6a5NfojO3I+K8VEqkH40p+/gplL2opNVfDKq4a6Ku+wpTH/D7DITTMB7jlPaIUSkx
         tV/cWEi4YiSRxleUUi5nIK53RyDqlTmDpHy0oMjjiRIlnJOQ9XO0gx5iyb9dNxUCMZKO
         SPYul0fsSTHkBsQVfEn7helxNIZA771UFY3D2T07sxyEKd8pNvzlX0HA0Lxlgs4IafPH
         SCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081772; x=1691686572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEowLIfYXc6RIyRT91PkflonDDx/X3GfoYD39DoAO1A=;
        b=KjW9K29wsj2NNp7wpX1jaJd7SqrDAH5qiNqUqv30KaCCa1QOiczGdzb8q2rflbp0zB
         4AZu6hnfBtnsMoWgzn1VMZ0trQaivqM8VPhHtOJBW+jPiw+bDXet8xB5HDYjKUGkAgKO
         LuNnghXzhOdjx+ypMTWtrSCC15qJtSgno05kMCHus9Zl7AM9p7MotGTN23rxnaszJ1pF
         moHXq2WXVaDgpZphSl/osUe+hXRyWZ7c2H+Kg0xht3wSwcHmd0Fv1hYbt/MMsr2jkjsK
         o7y0OjypRYGaec8w9a4ZeXXX4uPkPAycOOLGT+8D/bgVOUlYCjRu401+2OvJKyUn6OYL
         t3Tw==
X-Gm-Message-State: ABy/qLaLkttX11IBUXm6OCRKVJcWP6hbD5go368X8tmxUQugisx7dImg
	97hKt9EkzFqT+O2VRXjxF3pA4A==
X-Google-Smtp-Source: APBJJlGUXdW2NNz10Fux/nRQpZltqjxWUmDtdM4q1KLlj+1iviOxOtVo+24jR9d34ugZjDtaBVHrnA==
X-Received: by 2002:a2e:9593:0:b0:2b5:8bb9:4dd6 with SMTP id w19-20020a2e9593000000b002b58bb94dd6mr7964571ljh.12.1691081772282;
        Thu, 03 Aug 2023 09:56:12 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id h4-20020a1709062dc400b0099bc2d1429csm73228eji.72.2023.08.03.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:56:11 -0700 (PDT)
Date: Thu, 3 Aug 2023 19:56:10 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg error code
Message-ID: <20230803-2e2c22d06763eb9caedade6f@orel>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_095617_597762_3C203482 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, Aug 03, 2023 at 01:32:52PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version includes a diff that Andrew mentioned in v2 [1] that I
> missed. They were squashed into patch 1.
> 
> No other changes made. Patches rebased on top of riscv_kvm_queue.
> 
> Changes from v3:
> - patch 1:
>   - added missing EINVAL - ENOENT conversions
> - v3 link: https://lore.kernel.org/kvm/20230803140022.399333-1-dbarboza@ventanamicro.com/
> 
> [1] https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza@ventanamicro.com/
> 
>

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
