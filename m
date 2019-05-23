Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3D4C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 20:29:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8452175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 20:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccbQY4LX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Oh21H9o5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8452175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCkTQKnTc32SDf6YkHNB1xcZnBbDQw0xADh9xnFjRvQ=; b=ccbQY4LXVX7/8G
	CR1NLb9IYS7ybVXEHGlo3edTojm4xyKy8N3/6Q9L2I2/M9f1OHUTXi2lnhMrnMGgy/FgL90+sDGJy
	/FldXrwLmEQ4PmsEHeXcckG8sYZ40QLZXw1V4MpXNhXgCm9tG464AdsfFFGsc9ff84C3rAfEU+lO0
	KiUAg2U/5QLj7YYLY271kM58yYrVoXy8XgbpusGt+cmAybGpjh9momT12NMh63GAT/V5BbVNux8zx
	jpgfPmUVryXGKZKG4sH4neWoa39/tIPhRUMzjn0bmE/MRzok3jYEB6OymvHbvlM7eDiDi4DaFomJr
	pKqzlmWdLk/wj/efrQog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTuLP-0003c3-PZ; Thu, 23 May 2019 20:29:43 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTuLM-0003b3-Sz
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 20:29:42 +0000
Received: by mail-it1-x143.google.com with SMTP id a186so2210029itg.0
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=b890wSvSu6wn7E/uDIjk2vqaDgCqNzWOhAkC3m9/u2s=;
 b=Oh21H9o532d2n/TnnynzsE2ljIHzgvh1GxeZTfW2qHwe3qovfNr5GvwkMjmzzVASMz
 Ia9juX5Ktr3S8qTF/YJHNxCt6CaUVoykR+EYa013yQLepgHgtg0j0znllhIvqIAShZDw
 4WUocTAH0WMfZVqIMAevGQTiRV3Q7Wo1FYCD7Idb8bWJrytQ9B+mCrvaW/Y9kb3ddC8w
 qi0s1otayOcCHqXNqVEvIuOiPH3oe2ibsYGcrmU1UywHhpLR8LdjYq0apUM74Ra8RS3F
 T+zDEyFLJBLLEUvOaReB2N4eiDd3iTFZgg/vvjmfyoNCZXwF2JsBICr3Dggkrv/bqkih
 e3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=b890wSvSu6wn7E/uDIjk2vqaDgCqNzWOhAkC3m9/u2s=;
 b=H3TMkAvHpYnH65bR18jqiU5ixw5J+ZCGGvD8bFvmt4zEZ9VIYG1N+9oYK4vKXZc9K/
 IBlZOymY40b7K0G9+LV8B38qWOf7/vsYV67SB2MjAD1bfg3Cgofa9huhK5a37jvNx8A6
 0xFiAnIBBYFBYThXrHlerPYQEs3Nk+PlDoeH38/WNKfLo01mIibWaPJoKcJZ64hDacqB
 Y4QvPx97ks4YC8neShdz45H45R9+xTWlxy0rz0Cj4lvIjbJVCpF2b7OmewAyg1YazfjN
 b76A0xrdfewAitxnx1xElrKtYCfzzYLOzg3Ldc9earKuT7k8J8O6Z3rSLP1fdfDO3vK4
 Nnrw==
X-Gm-Message-State: APjAAAVaS1PgQcjuuYeN6kl7rAbtCy5nqAW5Z/Rdr6ePB9n3EGh/ZC29
 o/BD2EH7eE+BHJyh6Ls728DW6w==
X-Google-Smtp-Source: APXvYqwoBcWiq9kt8e9AFxHiOgATa2Rx2JHeWpNLhTfaKeetKbRVbLGHjaraqPj3ixUZof8y8n2B5A==
X-Received: by 2002:a24:d43:: with SMTP id 64mr7541897itx.114.1558643378930;
 Thu, 23 May 2019 13:29:38 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 i25sm194019ioi.42.2019.05.23.13.29.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 13:29:38 -0700 (PDT)
Date: Thu, 23 May 2019 13:29:37 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH 1/2] tools: PCI: Fix broken pcitest compilation
In-Reply-To: <1558642464-9946-2-git-send-email-alan.mikhak@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1905231329130.31734@viisi.sifive.com>
References: <1558642464-9946-1-git-send-email-alan.mikhak@sifive.com>
 <1558642464-9946-2-git-send-email-alan.mikhak@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_132940_999182_123CD825 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 May 2019, Alan Mikhak wrote:

> From: Alan Mikhak <alan.mikhak@sifive.com>

Please drop this line.

> Fixes: fef31ecaaf2c ("tools: PCI: Fix compilation warnings")

This goes down below with the Signed-off-by: lines.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
