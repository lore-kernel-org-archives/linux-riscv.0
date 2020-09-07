Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E5EC43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 19:01:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACD220C09
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 19:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9XbJ45W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6MazpFS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ACD220C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y4AgrHtlnRR/3hMngpr4At7OVRTDUYxHEMx18oPj568=; b=v9XbJ45WudSzMtUaTl85Ub1Tx
	Waz+/3u16AC8/rW+NeWFGf/erbU0G1TL6Pm6N+2PJ2cf7+MdIgovVwe6jS35DGULy7fr56pJAU41h
	VjMtrzTQYSBwf2QkB3upDAYV6ayy5z07T6ZFmRSwHiEUsVai93UUi2lcUIqUeV1MG4tbzWw+ZfbjG
	6/i9OC59SZ9ftDDC3lBfwA+l05hLGsmNkidNim5oJBlYcS40BsEJJytqFJj7U8b6EvDlPPA4++sHh
	xb8txtoZNuTQ5s+whS9iYKuPF0NdxrxjY1ocx0nyIwUh05YQeupLcGcCyvsG880DHfPzor6AH5kHJ
	15ZDSGHxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFMNk-00085s-VP; Mon, 07 Sep 2020 19:00:48 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFMNi-00085D-6i
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 19:00:47 +0000
Received: by mail-qk1-x72a.google.com with SMTP id w12so13335259qki.6
 for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2020 12:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ultTVCKnbL0cIumvbgd7ADKxSHF2oA5ehprjQ5o8rqk=;
 b=e6MazpFS87eyfhsvP5SIHx/6VfEUnHBrUiLWp3wdL+HWhcFkHJDxPDKteAK3DlZp1E
 Rgynh8mtC+gLFAQZA0nd7WsZtgIS4HCIqn27Gv2voq5mATpxxsKkka83COdKlwz992F4
 WjyvlzlxZOFeOCWgCKjhXsHk8TP0BoaNSc4+qCbZPaf3bX0wCE5438H7dpr6m8FCfPtp
 8ahuPEj4Zxk3wHsV8xt+g/b+DLmEUAu7bO6qTNB15+yt5aoO35aHaNcejkllEtqPw+H0
 BeqMkLB0H2yNnKZKbB9WdUJicI9PW44BizacEaib2rHnYmWHtDAS9HUQ3HaL02E1jhyO
 62+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ultTVCKnbL0cIumvbgd7ADKxSHF2oA5ehprjQ5o8rqk=;
 b=G3xfh9igKRgtaX7jh3KT6XxA6eOkja3Qp9V9QUI51TTyE2ohNa8kfRszgNElq5tGpM
 p3YI/YQaaEz3PtXKLFjjA2eLOt6K1DZ1OUvi2IHelynYnXDp0yuIEhs1SMJDKQmJEJBB
 GButPYoCga0MykT90X/Hox2tlRZ6hfGgR21zrPX2f/cvnquzK7mWzGIPMNrH3HxvTFHq
 FNTVcPQMs97UQqkxr3tyei4Kuh+eaL9Wo7LJ3DLOhrY5zqXpbjDPmhWFvqhk0ZGOHJ82
 a0J+HaNGDD5KnTUKNBckTTPTtRVA5CEQgb2+H2bx4i846aDlevAlrA9E9JLswG/4O3mw
 KCcg==
X-Gm-Message-State: AOAM531TLgb5s+hUobHAsGh6X6FZzEJgS/mtvRl8YRugg4FjM/ZNT72x
 QvRf109OR7xec93xLDkkFGA=
X-Google-Smtp-Source: ABdhPJxeXvjlSJQKbLzEVALgc3IMCWp4kC/aFtw+p3ZZy/g6vq86BDAIZ6YYdN+LTmjXG+xAdFUzCw==
X-Received: by 2002:a37:b942:: with SMTP id j63mr21001589qkf.138.1599505242410; 
 Mon, 07 Sep 2020 12:00:42 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162]) by smtp.googlemail.com with ESMTPSA id
 x126sm10429098qka.91.2020.09.07.12.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 12:00:41 -0700 (PDT)
Subject: Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from, to}_user
To: Christoph Hellwig <hch@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
References: <20200904165216.1799796-1-hch@lst.de>
 <20200904165216.1799796-4-hch@lst.de>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <86bb5644-fd97-8e54-9e5e-aa961680afd3@gmail.com>
Date: Mon, 7 Sep 2020 15:00:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904165216.1799796-4-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_150046_260906_217E4E66 
X-CRM114-Status: GOOD (  10.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in raw_copy_{from, to}_user

nit: handling

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
