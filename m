Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37334C77B75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvWRPwbjhiyc6qnsh+URpdUqUunoosGjbvw+ZfJQVZU=; b=jLDS3cy6S2v5Uk
	XDuETrBGmiAxEXJqM97To9zcIRjUJroZiNn8RuXyb6KtBbgcRCoM2iqNqo9fCQVzNz8lvBAXEuV7P
	DcgyN6PjRm3eFejVFDCCUwxz/dqmm5NPfiAPxULDabGlaVKaEZSaTkRjNVAzrAkKAhEJb3GlQUli9
	yss27My9SAGEXD8fUeqVIR1X70v/XEe4fEpfwl4JlKO5Kyb8HMKV9i/9TGDC4u2AN4IBOr2pL3lVV
	NrCzkVbdFqVpyIqjvL68r59TNAnVROkdaUOIoH6+k+UTIh8eRabe9t6qINa9eYqhl2ebYXTQc4HFV
	MHbVX6uwPf93G5ioKP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1putBm-00Aaze-1b;
	Fri, 05 May 2023 11:01:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1putBk-00Aawv-0H
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 11:01:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so25747496a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683284482; x=1685876482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCkAxCuMCPY8W83j46gVbVQ+tbACBh0KvMJD9eEfQ/c=;
        b=SLjkjXfz2dJopPBa6gCHMwCLE9X+GihIRLWd5RJ3XDsFuoZKml+vlRFRd+ABLzSzqM
         fjmDAisGDpNaxgqcySD/gafu6BW5zdYj5xBCFMyZ6P5iU6JcO0sp2/BLXnB5yH8Xllex
         jGjdSVw/PUj3jYxOgXcaZm5QXKY2pA98VMnjM2Yj8n9oCsTr1PP/e0YMgYoEWZSE6BbI
         32v7g2gDfjvNFVS0Dmvx873PPmeW+RPiY4ThBsL7iPLPFKsm5O6EPGSmMid/zgsuHn9x
         BjFucfzCB9kG7Zf9xtvA1cTOf/gkMkwvJk1BOtwJvEtIqKLvpkL0VALQ+HOTiRu0lxKq
         44vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683284482; x=1685876482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCkAxCuMCPY8W83j46gVbVQ+tbACBh0KvMJD9eEfQ/c=;
        b=e5CSYiCpX44L8pJ+48Zt9zA6ETVy1hUxsD0p2InwZi8YYtX5vI9AxAtRA8/Tt7iPd7
         2Hrxo+wtujxOVqXg8+oBKuzS3fsYuGJL43yQRJaowihMTefXfGh4O6eMtyJ0FlBXzPW3
         WBRIFgo3QK9I/20cJYeAgD6t+UBV3U4fxanmgdqLnpGytY6UE34HpfL7D2jVhATAHpZF
         KJeRfaJvzfPVBswRLykpMw9wQTOwt2ZJWdjwlfE6friBnxD3n4dlFp8voGBNhLbb6ry1
         YT7qnJNfzmUL8MRxdycFQ0YJ8kVdTcqmXxAPt29ub6RIkm2AYsqojuaTHC+w3fcIkLmN
         9b+g==
X-Gm-Message-State: AC+VfDwXUj6ikATgaXs630qG7+uhjAxbWhWGP+YqnCgwqiZ/Cec4leJW
	sJ/qY70sDkvn+wCKy/uDi0r2Dg==
X-Google-Smtp-Source: ACHHUZ5YCxiCnRjRCkNRUiPQkbYKUvkj3/qi8ItnbIpxxLu0wxqRis5SooFpTd5P1bCFEvYbBoCaEA==
X-Received: by 2002:a17:907:1690:b0:94f:6316:ce8d with SMTP id hc16-20020a170907169000b0094f6316ce8dmr1378551ejc.34.1683284481742;
        Fri, 05 May 2023 04:01:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hz17-20020a1709072cf100b0094e96e46cc0sm796408ejc.69.2023.05.05.04.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:01:21 -0700 (PDT)
Date: Fri, 5 May 2023 13:01:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 6/7] RISC-V: remove decrement/increment dance in ISA
 string parser
Message-ID: <20230505-af9eb91da13e4bb611cc75aa@orel>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-barrette-engraver-df0392651854@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504-barrette-engraver-df0392651854@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_040124_132721_4131913C 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 07:14:25PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While expanding on the comments in the ISA string parsing code, I
> noticed that the conditional decrement of `isa` at the end of the loop
> was a bit odd.
> The parsing code expects that at the start of the for loop, `isa` will
> point to the first character of the next unparsed extension.
> However, depending on what the next extension is, this may not be true.
> Unless the next extension is a multi-letter extension preceded by an
> underscore, `isa` will either point to the string's null-terminator or
> to the first character of the next extension, once the switch statement
> has been evaluated.
> Obviously incrementing `isa` at the end of the loop could cause it to
> increment past the null terminator or miss a single letter extension, so
> `isa` is conditionally decremented, just so that the loop can increment
> it again.
> 
> It's easier to understand the code if, instead of this decrement +
> increment dance, we instead use a while loop & rely on the handling of
> individual extension types to leave `isa` pointing to the first
> character of the next extension.
> As already mentioned, this won't be the case where the following
> extension is multi-letter & preceded by an underscore. To handle that,
> invert the check and increment rather than decrement.
> Hopefully this eliminates a "huh?!?" moment the next time somebody tries
> to understand this code.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
