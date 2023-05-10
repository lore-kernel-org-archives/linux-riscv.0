Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0164C7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bkt/XsVebbsnIcN2tUCRaRHaZMWlSzUm4F9AAZC/edM=; b=cpyoKKeHaPXPqq
	/wDpa83xq8Y/AipldNW1mhPRvZsqZpIa5TvAm5cM05jW74EKcGQNuq5Xzkn+AZdP054J9jksbda3C
	NXxEKegRZ9+8Emb7hmn1DJm7eCA0ZNk5+ami26yEGOgKs1/NmvQ9tqowqh7Xwi6/kIK7Y8i/hsotn
	DlRDNuDGk89mqyp8YfpgHzzFs6xTzgMyyKkd4vbRU96igu6gb07r8lk4m/7erT9hO+5g1KoN/A/aN
	Manoh4r0TYrItC1dWgFUE5w4CtPboSWyo2WJwDiTftzJeCctKlDrQXBuNUPR+P1hAzZN+luHkvIIE
	OPA0I2+fSXmxOmDyUz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgus-005kGu-29;
	Wed, 10 May 2023 10:19:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwguq-005kFp-26
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 10:19:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1aafa03f541so68594325ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683713961; x=1686305961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1t0ft/AfuKy/xQMa6et8iuTG4wcZxNYRj+6RIhEHQg=;
        b=QIn7qQyGu9KHA02ujG7t9C/xbo/Tw2O/IeCeYI61VMn9+jgbUaZbg1NtaoLSGqn1Ok
         Xe90gJ+r3SRKeS34/7oOM6jvIbWyhjhQ/TvzKX6rIy9BTF3CMXtkrrWy8ohl+giADPhq
         N/uoad4SmyQsBNdlpRe+/e+PFgXOvrjakYFTyPhROB+6YkVl1Jyd8sllHP1QeKv2Q9nD
         K/19jMnBenBArM/nj0/uPipZfqw5hvKKQZGLnpG5m07w8IEpB2hOqFPpc27RAxFlAgbJ
         H55faVr/w8momTJ96c0CYKQ74gDk+ttrdT+UYy6xk3yNrVyIkQpf9tAG9gFUZ8c8hv4Z
         cPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683713961; x=1686305961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1t0ft/AfuKy/xQMa6et8iuTG4wcZxNYRj+6RIhEHQg=;
        b=Ysk6G9D30eXTCsLMJUeM5+Ri4nghs3l5pDIF/WF8izTcziqKe4Z4DHmm+h0y2rjXqE
         Heyd9HcXfSoRR68JxvQM1KBW5bNNbHXshSGZ9mcb4tSAUCvmHvdmUZPFCMNwtoaZM6E/
         n/6Piha16BCLttVR1lYz0PPFoEQjLhB1uISZMylO2qurNxo0hK68ts+if1l7irmod8UC
         UxGvypCe5v8uSFjXiDDzHFLPK25aLApH3nmlUz7kvTya1QDG0DZIZEcDo/hpiyCEaYyf
         C8cj9zyFbuMQaaDXx+BI7JEAXxAYb4ayJnU1k9xMzOs9SuV000wMSDad5f64ZiJn/Z7Z
         DqSA==
X-Gm-Message-State: AC+VfDx/HbSjIR15v7PNwwrQldn+SDLRnTOeNiTxtmxiD0wiLRDPBWNo
	Urm8jxJinkuQftmwTyI4TiA=
X-Google-Smtp-Source: ACHHUZ67FWUbYYJrDsy2nIlpJYZhkPsodT3ItqoRkKPrzKQ+qLZzU8rxzk62MZG7RanBjvpefi6vIA==
X-Received: by 2002:a17:902:d3c6:b0:1a9:7e44:17 with SMTP id w6-20020a170902d3c600b001a97e440017mr15067440plb.17.1683713961643;
        Wed, 10 May 2023 03:19:21 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001aadd0d7364sm3393419plf.83.2023.05.10.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:19:21 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	jszhang@kernel.org,
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH V9 1/4] riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Wed, 10 May 2023 18:18:54 +0800
Message-Id: <20230510101857.2953955-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230510101857.2953955-1-suagrfillet@gmail.com>
References: <20230510101857.2953955-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_031924_691182_C7C7B059 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SW4gUklTQy1WLCAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBvcHRpb24gaXMgdXNlZCB0byBz
dXBwb3J0CmR5bmFtaWMgZnRyYWNlIGluIHRoaXMgY29tbWl0IGFmYzc2YjhiODAxMSAoInJpc2N2
OiBVc2luZwpQQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkgaW5zdGVhZCBvZiBNQ09VTlQiKS4gU28g
cmVjb3JkbWNvdW50CmRvbid0IGhhdmUgdG8gYmUgY2FsbGVkIHRvIGNyZWF0ZSB0aGUgX19tY291
bnRfbG9jIHNlY3Rpb24gYmVmb3JlCnRoZSB2bWxpbnV4IGxpbmtpbmcuCgpIZXJlIHNlbGVjdHMg
RlRSQUNFX01DT1VOVF9VU0VfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIHRvIHRlbGwKTWFrZWZp
bGUgbm90IHRvIHJ1biByZWNvcmRtY291bnQuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi9DQUFZczI9ajNFYWs5dlU2eGJBdzB6UHVvaDAwcmg4djVDMlUzZmVQa29r
WkZpYldzMmdAbWFpbC5nbWFpbC5jb20vVC8jdApMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi9ZNGp0ZnJKdCslMkZRNW5NT3pAc3B1ZC8KU2lnbmVkLW9mZi1ieTogU29u
ZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgpUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
QWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCAzNDhj
MGZhMWZjOGMuLmUwNjMyNDkzNDgyZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisr
KyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtNTgsNiArNTgsNyBAQCBjb25maWcgUklTQ1YKIAlz
ZWxlY3QgQ09NTU9OX0NMSwogCXNlbGVjdCBDUFVfUE0gaWYgQ1BVX0lETEUgfHwgSElCRVJOQVRJ
T04KIAlzZWxlY3QgRURBQ19TVVBQT1JUCisJc2VsZWN0IEZUUkFDRV9NQ09VTlRfVVNFX1BBVENI
QUJMRV9GVU5DVElPTl9FTlRSWSBpZiBEWU5BTUlDX0ZUUkFDRQogCXNlbGVjdCBHRU5FUklDX0FS
Q0hfVE9QT0xPR1kKIAlzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiAhNjRCSVQKIAlzZWxlY3Qg
R0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
