Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76481C9EC86
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 12:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXA8jJY+fHFLl+pemOM9F0gJNVQTkBmDUyxR0lNNgiw=; b=nB0voffEND0lpv
	ij1WJFcZjpiJysFMYaJWtzlo+95yhkjBdlBd/aPYzkPxzoCorHjYlQ5drSU7/D4l7aKjQERZtXSJR
	1SpYZEc/p299Nm/s28htcb8QfeRkZV5CekDc5EtdixpqLLofqiY2XKIMkj8vWs0vkzgI6cOrYO6Wp
	CwQXeOIEProPIKUkFptCozVsjdhXDGvS6LvtocfEN5t/Nb9iIzrlhtzUbhWzoAEPFaOoq5DDpF5GN
	kRfhZwtNM91/n3w2daT7lUY9MTVL9fLjDrH+1P0QlO83shAH2494j69xhKeqWbYpHgEdj/WvthNsV
	9KhTrqdyp+i7MeQFrRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRk-00000005MBE-26Mu;
	Mon, 12 Jan 2026 12:55:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRh-00000005M9m-271U
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 12:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aw/NV8LRyH0v6ORkecK6sJJhDNFc4SC6s3IiJQNZsCk=;
	b=YRo8PJr6+SGZWUpCfYNW9zLKix4NQVEtnnthrxO3vCv51bN8YjvoAZTK00SrCpBDj/JsUz
	GCZZLCP+vbetIPVWTQdsinhz4dUvQ1rsYfGkWbTlOouGrTkVVvWhHghN14AlsXk6+IFQ05
	0DDg0BBNo9sVc+8HIxMeIFIx+OcIZ9g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-IazuPXNCNqSjgCN809-f1Q-1; Mon, 12 Jan 2026 07:54:55 -0500
X-MC-Unique: IazuPXNCNqSjgCN809-f1Q-1
X-Mimecast-MFC-AGG-ID: IazuPXNCNqSjgCN809-f1Q_1768222494
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b801784f406so802978166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 04:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222494; x=1768827294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw/NV8LRyH0v6ORkecK6sJJhDNFc4SC6s3IiJQNZsCk=;
        b=dl8EnC/7H0W3FZcurkFp3V8mjqkwkGSd5eRGqXgHwTU41vu/Pfok4LlIDKOpfX+9iQ
         QCg6MvWrgnqP7h2zI84UEKd9pu8SPs91akUcW0JgcogiSCxCZzYgTgYgItTe5xa+VGB6
         eELDL3cB3PlahTOAIEQo2n7UYqgIR/ocuuBHjDgM6iZwvtKHt9rONSONgUMix0A3+Zh8
         jhkxJQr63h8yk/Z0/7/EW0QTazHS382Y7GP0dEnKkn4bQ35BDiwHKtHvAXkY530YHBdX
         RyuIVOkO1mBSnSLycJdQK+R7QZ7twNCR4HRXs7L4mtK2BRXVTFOjpP/LO+zsVrRyerwS
         TBXw==
X-Forwarded-Encrypted: i=1; AJvYcCWv8YP4df7o7IXxjXpdQjSaGGFJW6SSEBKwKdLSD5kzuCTwk3hYxGJPWMJYsE2U6zoP0sJfwpPZ5yGSpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLqaGGZPi9V9o2zWQLndkgf5QDWPPBH2Fk94twBuzaBR8Glabs
	Qpm88jp5cTEX9Ws+fsupDU9TWVjnqEy78mqU1jSPAeMoHuqiIT/0ocUfd+kk3TZQFTLFHu+XgTr
	COYn02cvtO8MOz4lZO//Lkz0vdW9qWlRW+Azw+VYUE1sUgbkkGnty8sr3hUBLIefN6z3emA==
X-Gm-Gg: AY/fxX5Qyw0Qun8keuOBDr0CD3AeZ5StuY6/9+LVdAefdDMS8GEjaMcW0YD2sCSeIyy
	G67eKiv1T6gwrN0U59ZkpyF3tubj3YTSISNW/uXBzuPw0540b3sIUphg9pxdaVjgrfo5uWjJPYa
	o7RksentVxmLNjCRdNdxtQ12KJUwrx72C5a4DkwUsHz51wK1py6M+ieJrSydgfG8hSH0le/PW7d
	5GA9KeJlx9InzYldW4hdxMjDVjklP2JrmCMshVqUhr8T5nF7q+tpRDr7NQ7fz02UNM85W+qos58
	wQ9EfUSV3ciMm48uNbVMgmBH/Rp14IIDcA2OY6W1aLbiy2+bnDwj2X4UOLJZDX3ZHv//8BfWDD3
	c2jG2DJSgfMaao5GMzc5SEXLRw0ym+vQ7pG2Ggu8ECy3WERKGq9SfJTP9rdo=
X-Received: by 2002:a17:907:b59c:b0:b86:eda4:f780 with SMTP id a640c23a62f3a-b86eda503ffmr427900966b.18.1768222493912;
        Mon, 12 Jan 2026 04:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQQUtq3Zy/c64KpzKtlRB+1NOLYJQC+enp8zQ7vlFIka+NmHMqyup9Wyx1StgQLyix4fqkyw==
X-Received: by 2002:a17:907:b59c:b0:b86:eda4:f780 with SMTP id a640c23a62f3a-b86eda503ffmr427897866b.18.1768222493414;
        Mon, 12 Jan 2026 04:54:53 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:53 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 4/5] riscv: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:30 +0100
Message-ID: <20260112125432.61218-5-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o3lrj-GpXuUvDohT_Bi-NU_sIMKChcjS-eBEPFCeKFk_1768222494
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_045457_858945_6808A422 
X-CRM114-Status: GOOD (  12.71  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the riscv kernel configuration to set NF_LOG_SYSLOG and drop
the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/riscv/configs/defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..0b99a73f43b2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -64,6 +64,7 @@ CONFIG_INET_ESP=m
 CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_FTP=m
 CONFIG_NF_CONNTRACK_TFTP=m
 CONFIG_NETFILTER_XT_MARK=m
@@ -75,8 +76,6 @@ CONFIG_IP_VS_PROTO_TCP=y
 CONFIG_IP_VS_PROTO_UDP=y
 CONFIG_IP_VS_RR=m
 CONFIG_IP_VS_NFCT=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
@@ -84,7 +83,6 @@ CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_NF_LOG_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_FILTER=m
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
