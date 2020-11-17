Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7A8C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 08:27:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A4724655
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 08:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8z8GHGE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSih97Qg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A4724655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TuH2NuBjfVX0q8U93DjkqEkKHBLmCyokAM7QECWSJwc=; b=a8z8GHGEar5fvD7Qmin7ww5Uo
	Pzs/mcUvS/5OehUjS4Sy3M9uN3V5X0uD2Hr/9HZjx0t99JyozD+5ZpK6+++xcrXd7lfUIIAGyK0w7
	TIECl5uV5xzKgLW8p33L2k1HV6WaJznALe/Np8g16BQ4dMYTSCy1/k3LH4BGnudclRKblXMUtQH96
	rgucxAKoMVCibtxETn/mx2zn6aXKNkrck+CKhTNXmHCOcqsBNQthy4kS7w5JYXYcklNOvjJwE8U3w
	Vr3q7uQPlUlIxNdSp3sni6NpbVecqQnUgQTRKRZBe7ZW5lM1NvMTgkFtDiagQgwFDJCmO1vP2Am2M
	ABvr1trfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewKO-0008Tj-UC; Tue, 17 Nov 2020 08:27:05 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewKL-0008Sz-Pr
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 08:27:02 +0000
Received: by mail-pg1-x541.google.com with SMTP id i13so15663684pgm.9
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 00:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=thC0vwUoC+dS5Z/fyfQ4HgfqnUUZ2rF5Qe//4cJ/e/s=;
 b=RSih97Qg5lNmEj0m87IY+niwHqXQAIC0ruEFGfQ30wLErhKzhrQ/CxWBfri5UoFeld
 Gim6tHlV6PtmyWAhIqA3IPrcXvEuQKObM42h1lCx3Ig5eMwhemVLyVXlXGYPNlv+QtiW
 GP7RbKgbLDoi34rHR4sn6rA7LydveHF5Ct2mJ/nlCJNyjvJTbn+BsihXINkZVHhsJgU9
 DdU6Nu5+Q7G8KvUDixsnqLHkbTbvc3dzrf8XHGmYNMhdC+b1DsvkI6Nq9N3om+PMNOKr
 tsAg+hvHCONXRTybQAwlqJ2ZlFGlzw4zs7UWeCJsor4+3V60Ud6WRhs1epEDwUYt916a
 i1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=thC0vwUoC+dS5Z/fyfQ4HgfqnUUZ2rF5Qe//4cJ/e/s=;
 b=MAJDqZUFi6Anq6spMF016uLuSqf3Etzi5KHVNtrSBCXihE11veRi2PA1qBMEqo7epf
 66wISrMIXdwoAumVrC+mMdEJU7M56bI4GE/+LlHJwwFGafPJ3e1HFtYYa95aPo/SBKAA
 5LV8pxAthTHpcjMxmwq52f/g5qxdSpPOp4dmu+8ibac5+kfkpfSP/VDokTb+Z7tuDT4f
 5Qaiyk+bH4eK11VcS5NbRCwH3jZdbhOc0CEpwmdR2UxzVX3ZwUUlrA2+aoqZ/eNb6HFv
 Px0hBfYvz7dgJ8PINodGa6nYQ1umsrUgcnGNFnEuU6KYgTWUAyjCq2u4ECWEGbzFsN7u
 2BBQ==
X-Gm-Message-State: AOAM533LdoIeSCtG3x+telxH951AO9YaNdPB9/a0ZaHExQs9MJqNgBWr
 PQi0mUW7t2EyHDRKuZLMXGg=
X-Google-Smtp-Source: ABdhPJwHbpYcDC4CrF1mzIpvea+B1cveoQuoSptG8JPZ/wuGPZ8c47r1CEbwD7dwW7n1FDA6IsIGyQ==
X-Received: by 2002:a65:5948:: with SMTP id g8mr2607912pgu.51.1605601619614;
 Tue, 17 Nov 2020 00:26:59 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id c12sm2251671pjs.8.2020.11.17.00.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:26:58 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next 1/3] selftests/bpf: Fix broken riscv build
Date: Tue, 17 Nov 2020 09:26:36 +0100
Message-Id: <20201117082638.43675-2-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117082638.43675-1-bjorn.topel@gmail.com>
References: <20201117082638.43675-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_032702_113929_CDB09418 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, xi.wang@gmail.com, luke.r.nels@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIHNlbGZ0ZXN0cy9icGYgTWFrZWZpbGUgaW5jbHVkZXMgc3lzdGVtIGluY2x1ZGUgZGlyZWN0
b3JpZXMgZnJvbQp0aGUgaG9zdCwgd2hlbiBidWlsZGluZyBCUEYgcHJvZ3JhbXMuIE9uIFJJU0Mt
ViBnbGliYyByZXF1aXJlcyB0aGF0Cl9fcmlzY3ZfeGxlbiBpcyBkZWZpbmVkLiBUaGlzIGlzIG5v
dCB0aGUgY2FzZSBmb3IgImNsYW5nIC10YXJnZXQgYnBmIiwKd2hpY2ggbWVzc2VzIHVwIF9fV09S
RFNJWkUgKGVycm5vLmggLT4gLi4uIC0+IHdvcmRzaXplLmgpIGFuZCBicmVha3MKdGhlIGJ1aWxk
LgoKQnkgZXhwbGljaXRseSBkZWZpbmluZyBfX3Jpc2NfeGxlbiBjb3JyZWN0bHkgZm9yIHJpc2N2
LCB3ZSBjYW4Kd29ya2Fyb3VuZCB0aGlzLgoKRml4ZXM6IDE2NzM4MWYzZWFjMCAoInNlbGZ0ZXN0
cy9icGY6IE1ha2VmaWxlIGZpeCAibWlzc2luZyIgaGVhZGVycyBvbiBidWlsZCB3aXRoIC1pZGly
YWZ0ZXIiKQpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBnbWFpbC5j
b20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvTWFrZWZpbGUKaW5kZXggYzE3MDhmZmE2YjFjLi45ZDQ4NzY5YWQyNjggMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQorKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKQEAgLTIxOSw3ICsyMTksOCBAQCAkKFJF
U09MVkVfQlRGSURTKTogJChCUEZPQkopIHwgJChCVUlMRF9ESVIpL3Jlc29sdmVfYnRmaWRzCVwK
ICMgYnVpbGQgd291bGQgaGF2ZSBmYWlsZWQgYW55d2F5cy4KIGRlZmluZSBnZXRfc3lzX2luY2x1
ZGVzCiAkKHNoZWxsICQoMSkgLXYgLUUgLSA8L2Rldi9udWxsIDI+JjEgXAotCXwgc2VkIC1uICcv
PC4uLj4gc2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8u
KlwpfC1pZGlyYWZ0ZXIgXDF8cCB9JykKKwl8IHNlZCAtbiAnLzwuLi4+IHNlYXJjaCBzdGFydHMg
aGVyZTovLC9FbmQgb2Ygc2VhcmNoIGxpc3QuL3sgc3wgXCgvLipcKXwtaWRpcmFmdGVyIFwxfHAg
fScpIFwKKwkkKHNoZWxsICQoMSkgLWRNIC1FIC0gPC9kZXYvbnVsbCB8IGdyZXAgJyNkZWZpbmUg
X19yaXNjdl94bGVuICcgfHNlZCAncy8jZGVmaW5lIC8tRC8nIHwgc2VkICdzLyAvPS8nKQogZW5k
ZWYKIAogIyBEZXRlcm1pbmUgdGFyZ2V0IGVuZGlhbm5lc3MuCi0tIAoyLjI3LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
