Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC41C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 11:00:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD68A61462
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 11:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD68A61462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=isovalent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7SYypBJ0xWTE6banwvMgLFOxHrvaw1/7qoKOoaH5KcE=; b=XeY/B1rBtLal3l4MKWSHL8LGg
	Q6l48dRtN1YG8cLko5gPkaKGtiRVtQC/y1azHzmfW8UZ6JeB1Ob2GEfpT54BgfOnffHzZd6nmL4BP
	+tNRfcAcKGF7FD/+eV8CML64EfpA5FGLUBPZtcZCp6S9Iv2gXDokQY9hLIB6+nXSfB04TZWhbLLAN
	8ja9s7dO0hnZCfMUty5SY6rBGy/DSa5/Ht6GIru/NBm/V2dZOA/rJFjZSNrNd+zmDo9yuEUH+T+vL
	KWxwTRGt8se56DVs9A7p9KT3sRNAfod5MopJ+O7nHcSNmY0/CILeXo/6h5ujib8if3tkYiRFdq4yM
	FEkgVFO8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZtXV-001LvU-2r; Fri, 23 Apr 2021 11:00:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZtXP-001Luz-OB
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 10:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=POTZ/1KbTme2ehdkYN4t8NUzorpYmuLDB40ValCRCzY=; b=Z+fuyk+2vDip6nEgyMch08eFPN
 TtA0z1Xeh8aQlUlh6jV4V9uqHLUHjyuvLxwlJD6/2tDlqQhfQX1EG1SQ/v/YTCA6zg5R2ER8TrjIy
 RD/hNPxHogNrF4fwZOGIE18so5ZB2V1i7DnMEJVV7FN7QFkXswVUnvgsZrCqjt8gYg+gE8lpbPyD7
 8JhkefsPDcqw59EZYiBzX9E+AlSvE6nhGouxMsdw2uuoewEt1s61n37hTF81mESGNzdW5W1AFKDzB
 CeGblavrI/+m8axipRAE+Yzp+T45VQ2BdZSnHBLm9ikWjVTengJDZ0HegeTFtDKdqoh4TaDWQIi3w
 aV12CFpQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZtXJ-00ELgp-OE
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 10:59:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id w186so21233807wmg.3
 for <linux-riscv@lists.infradead.org>; Fri, 23 Apr 2021 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=POTZ/1KbTme2ehdkYN4t8NUzorpYmuLDB40ValCRCzY=;
 b=GQ9SWSJA7G7fyBqL5po7yWgTUyHybJVBlTbgimQMgeLWnHWPXCKisioR3lZg+tWt9h
 z7HehOh3qZDxqUF30ai6ZxU2U1Ow8Hgk0PqsAAC8Krl1BFBv1LZT6QdVT/JFwyXax67L
 yuhPNrcw/yNhw/HJ/+mBzX14R/l6x0ltK3lCOOHEpIJIqdhDC2YNufJNDNzcMBJzYj7J
 qXutqCgEPewjWKcMIBsTzFe/Bmpc7u7/mRj+o83NFL3pJXd98Xo9so+tu+SwhEVXrFw7
 JXcq+GREZl6F3rYzfj9RA96tSdlkEWNtZt6P/WPXfX78yWs83/u4GkJ5e7gZ4nQ0GGXG
 J7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=POTZ/1KbTme2ehdkYN4t8NUzorpYmuLDB40ValCRCzY=;
 b=MUALU4jVFrmwPJJAiA2VPZqGRwEZJB4gnaqDS1AJn11vZTcg8Azus5U3nyh31+j9IU
 x8cQixyNEaaLTgD5JAyKa4D0mxjyZdS19lALQuzQ6fjzv2dmgJtVG6RXhgd7yzm7XY2x
 lecA7Sbpns5SeVZtsUMiLJEFcDtMuvrchGry0c0M0Kuqn/OAO2UAvzDNxkd4nDURJnHt
 6NGn2fpC4oyzoD7FRzwzD43Slaw9vpZU7KH7/l5sEkAY2FwDm9ym43U4hu0aX3w93rzT
 bWAul4nvq6YI+Jn+sqklOMolfCIAmWtMNlj9pJMKdEMu79+z5b/hGypXSjvMzcmyKsbr
 bLpQ==
X-Gm-Message-State: AOAM532sJj3G5v5kvqRvYUab1KszH4TNPjOTSZMvuO7kc0oB1yv2vhd6
 kqYiGOv4DW91U3JdGctgPQBXkQ==
X-Google-Smtp-Source: ABdhPJzObvm9TMswQFwB877SBftpV3WuHpQFVBzCA+XkW+5tO9tLL2qswInPQ8jeRFQ5yWhqFZ0H4A==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr3570424wmf.104.1619175586997; 
 Fri, 23 Apr 2021 03:59:46 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.88.56])
 by smtp.gmail.com with ESMTPSA id e18sm9152733wrc.85.2021.04.23.03.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 03:59:46 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Shubham Bansal <illusionist.neo@gmail.com>,
 Mahesh Bandewar <maheshb@google.com>, Will Deacon <will@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, paulburton@kernel.org, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Tobias Klauser <tklauser@distanz.ch>,
 linux-mips@vger.kernel.org, grantseltzer@gmail.com,
 Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Luke Nelson <luke.r.nels@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 KP Singh <kpsingh@kernel.org>, iecedge@gmail.com,
 Simon Horman <horms@verge.net.au>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Yonghong Song <yhs@fb.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>,
 tsbogend@alpha.franken.de, Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, Wang YanQing <udknight@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 bpf <bpf@vger.kernel.org>, Jianlin Lv <Jianlin.Lv@arm.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
 <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
 <CAADnVQJ2oHbYfgY9jqM_JMxUsoZxaNrxKSVFYfgCXuHVpDehpQ@mail.gmail.com>
 <0dea05ba-9467-0d84-4515-b8766f60318e@csgroup.eu>
 <CAADnVQ+oQT6C7Qv7P5TV-x7im54omKoCYYKtYhcnhb1Uv3LPMQ@mail.gmail.com>
 <be132117-f267-5817-136d-e1aeb8409c2a@csgroup.eu>
 <58296f87-ad00-a0f5-954b-2150aa84efc4@isovalent.com>
 <6a809d3f-c9e3-0eb7-9c1d-a202ad848424@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
Message-ID: <ab1c3803-179c-7882-2bba-9eeda5211ad1@isovalent.com>
Date: Fri, 23 Apr 2021 11:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6a809d3f-c9e3-0eb7-9c1d-a202ad848424@csgroup.eu>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_035949_818971_4B8B85A2 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MjAyMS0wNC0yMyAxMjo0NiBVVEMrMDIwMCB+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4KPiAKPiAKPiBMZSAyMy8wNC8yMDIxIMOgIDEyOjI2LCBRdWVudGlu
IE1vbm5ldCBhIMOpY3JpdMKgOgo+PiAyMDIxLTA0LTIzIDA5OjE5IFVUQyswMjAwIH4gQ2hyaXN0
b3BoZSBMZXJveQo+PiA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+Pgo+PiBbLi4uXQo+
Pgo+Pj4gSSBmaW5hbGx5IG1hbmFnZWQgdG8gY3Jvc3MgY29tcGlsZSBicGZ0b29sIHdpdGggbGli
YnBmLCBsaWJvcGNvZGVzLAo+Pj4gcmVhZGxpbmUsIG5jdXJzZXMsIGxpYmNhcCwgbGlieiBhbmQg
YWxsIG5lZWRlZCBzdHVmZi4gV2FzIG5vdCBlYXN5IGJ1dCBJCj4+PiBtYWRlIGl0Lgo+Pgo+PiBM
aWJjYXAgaXMgb3B0aW9uYWwgYW5kIGJwZnRvb2wgZG9lcyBub3QgdXNlIHJlYWRsaW5lIG9yIG5j
dXJzZXMuIE1heSBJCj4+IGFzayBob3cgeW91IHRyaWVkIHRvIGJ1aWxkIGl0Pwo+IAo+IGNkIHRv
b2xzL2JwZi8KPiAKPiBtYWtlIEFSQ0g9cG93ZXJwYyBDUk9TU19DT01QSUxFPXBwYy1saW51eC0K
Ck9rLCB5b3UgY291bGQgdHJ5IHJ1bm5pbmcgZGlyZWN0bHkgZnJvbSB0b29scy9icGYvYnBmdG9v
bC8gbmV4dCB0aW1lCmluc3RlYWQuCgpSZWFkbGluZSBhdCBsZWFzdCBpcyBmb3IgYSBkaWZmZXJl
bnQgdG9vbCB1bmRlciB0b29scy9icGYvLCBicGZfZGJnIChCdXQKSSdtIHN0aWxsIG5vdCBzdXJl
IHdoZXJlIHRoYXQgbmN1cnNlcyByZXF1aXJlbWVudCB3YXMgcHVsbGVkIGZyb20pLiBUaGUKcmVx
dWlyZW1lbnRzIGZvciBzcGVjaWZpYyBrZXJuZWwgb3B0aW9ucyBwcm9iYWJseSBjYW1lIGZyb20g
eWV0IGFub3RoZXIKdG9vbCAocnVucXNsb3dlciwgSSB0aGluaykuCgpRdWVudGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
