Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8838BC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuZrAlKWy0SJ58mxGjKQnFte+qDETNFU//1FF2WHNC8=; b=zx06zSK4KYd3uZ
	0pjALzn/W6pz5NHvZ2jKUVURX6DXVrnf/200+fgZPuQKtrpykjJ7y1SbMScG+ZILon+5BAsstRGmn
	VFXXMXzjP3wRTE0rXmmO7QKmiNUNa/vgAp2oyowI9CqaqAJ69lkG1s+bWQ5FQhWWgBGq3QtKoFSkl
	ZAXF3jiCesXDW2+KWankBNseF02xJoRr2nEr7Nb/dNcEZUkMQb7UQGry+62K/hoOHTC9iCXVinOis
	Hsjq4RVvR8exJB9mI2TXBSTknpctSeuZFe0RDmwZCwPluQlRoenOH1upS/KSgWO9GoKZ3M75uYH0M
	R+Bicj5sCc46nNdc/ndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsvd-00000005yPZ-1dGS;
	Tue, 10 Jun 2025 06:57:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsvb-00000005yP4-1JDv
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:57:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2345c60507bso35786595ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749538666; x=1750143466; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L4xukjuXu3o0NcLfkD4BlUya4WbjsrMWpKI/1kjJCc=;
        b=JwvChAomSxxea+ScwO7rciKXrsTke4kjKMIVFLVawQZEY8GciiIogWNql/5isZbsCi
         /A73xl7I21P/Ld+Yme5i1DriWtT4fcg9meSmbvbGS0p9o+bV3J7H27bBjQCBDwfGVMYJ
         ZSW8UR/qv/yv/Ow6nfGa7TpsN8+064dAKjq26Bw3sM/DMlWOJnpsMEmrqC6FgMcUEMRH
         50BzQHUua/B5DhzJmWKkrSmbqYjMSoChzUAgnOVkjJaFGLjI5YqpgRlCzJy8RWXVR1pv
         xMgIOmc1tdWsR88ZRPvOejrgpk1HXTdlkzejeQcgtGMj+xDwleSmELUNy6jJ2RzSq0jd
         TujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538666; x=1750143466;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/L4xukjuXu3o0NcLfkD4BlUya4WbjsrMWpKI/1kjJCc=;
        b=CvjAxdp4suTTl7ns/6ffL2WG6LN5Ur9O6d4bidGGhQ5Bydg4WJKtNrXtn+ODMTBq0c
         i3wvZ01qaHwdFI7nYEpYLSvOjJtCwsiZtdZP0L8WrGZ2dKYcFB1ovQc7lwOjCxmkNSrv
         9XUOdXJ3YrKCcxjcWb+IMYE9huAPcw0tO7A/I6XBu57v72sbDG0GEf5amZ43QlnQ+GAx
         CVwRu3UvTejkGvizOi0VNoOHYOOuc/sX1oIWS3pl3Cmol5JTJwNS8oB5W471L6pr5tuR
         6DNy1YR6htj3OU423Ef6rOSrucrkgJjEOcCbntHZ9JC60D4rZ96REmQV70YxGcy2Ta6K
         JerA==
X-Forwarded-Encrypted: i=1; AJvYcCXJaQQoHevde8QFal4xxagTWAkmofq6ZFxA5/3AuMbTqeGdawtfW2l80rFqvi8/JqwNzY9t4I0io6xmew==@lists.infradead.org
X-Gm-Message-State: AOJu0YytFPRplkmDoUGNHIsOJPu7sVS2J1py8fuzi7hqFyy/zA9CvAqn
	OXNGobtmeyAGjjhY0pVcerKCp+DTOlBXY0CnLEfmfN9tXUd9Q2WQ+FGD
X-Gm-Gg: ASbGnctsAtnq6I86hZTZzlCjuS1lVkKDMzVxonZgmVFJ6GwEYyJRhKO27nTXdaKvX+h
	F22sRz1NHgzGTrnBzGll3XpoK3Z+OCJvr7RU8YwzvxIQ6kGdho37ei1DIpmPwl36H5/4rKVmEYP
	1n25yNzx8x+npiWKnGZrlkS9uqN6OdAIDfc+XI+CUnUdlG2ymGSNlEsvGw328mIRGIutrZ7pEjO
	vv5JRFFiDAjVPekXziFdB2WrHe9yff6TvDdWpYLu2A3+xqbvQMit5Yf9m3mR2DgKrMh++saWqlK
	sQ2kCygAtKTfS0p4TXqY+4IHSxTkJ0h8mIygzGINzNN9OM7Opv9DsDhVRyURdgxDNVCMILF/Cxa
	pku4=
X-Google-Smtp-Source: AGHT+IH4bjAX98tWFNKtoOACDhCgsCpt0WZwKnbIRTxkTlg0omIJbHw9927Nx6yXkn4NuPf+PcKx5g==
X-Received: by 2002:a17:902:ea04:b0:234:f4da:7eeb with SMTP id d9443c01a7336-23601cf42a7mr206871195ad.7.1749538666564;
        Mon, 09 Jun 2025 23:57:46 -0700 (PDT)
Received: from smtpclient.apple ([209.9.201.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9d2sm64668825ad.113.2025.06.09.23.57.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Jun 2025 23:57:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
In-Reply-To: <20250609201306.GD1255@sol>
Date: Tue, 10 Jun 2025 14:57:29 +0800
Cc: linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au,
 paul.walmsley@sifive.com,
 alex@ghiti.fr,
 appro@cryptogams.org,
 zhang.lyra@gmail.com
Message-Id: <EC8AB5A0-D5C9-4D18-A986-DE66BE46E09A@gmail.com>
References: <20250609074655.203572-3-zhihang.shao.iscas@gmail.com>
 <20250609201306.GD1255@sol>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_235747_340979_F4B2B2E4 
X-CRM114-Status: UNSURE (   8.72  )
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


>> +void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>> +  unsigned int len, u32 padbit)
>> +{
>> + len = round_down(len, POLY1305_BLOCK_SIZE);
>> + poly1305_blocks(state, src, len, 1);
>> +}
>> +EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
> 
> This is ignoring the padbit and forcing it to 1, so this will compute the wrong
> Poly1305 value for messages with length not a multiple of 16 bytes.

So Does this mean here the argument of poly1305_blocks should be fixed as poly1305_blocks(state, src, len, padbit)?
But since the padbit is set to 1 in poly1305_blocks_arch according to the implementation in lib/crypto/poly1305.c, 
it seems to be no difference here.

Looking forward to your reply.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
