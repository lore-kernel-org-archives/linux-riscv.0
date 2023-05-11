Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED4BC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bkt/XsVebbsnIcN2tUCRaRHaZMWlSzUm4F9AAZC/edM=; b=R7KXaFqvDdGw1H
	DBBJsY+ySmwGUnexh9qdTFKCQ5lgW+dzLWotDNHIg9PyuI7n/kahpWEbiAXULLT0c8kXfwvFyRRNl
	wJRw/c7aoOS1Y/nq0HuDZ3BipgLh0Af4/9tetFO6gcJy++x0FpLaQyP01KUA3kKb6NiTJgRxOJz1Z
	GMNu54MdLZ4DpZRtzUiT1A0plBmCuH6D80Ld3IHiTNNz53I71kf5NCuL96qm/Hg/q703sYWy+q+0T
	GeoAhczCKtKjMNY81w0/t6OFEuWmEZiWYbYMg5wgWvz2uR9DmlexpvQYmVMZewVlDdWDuTPEYfVsv
	8ucQ9EzDvMyCkXeGaAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2fK-008MHo-0R;
	Thu, 11 May 2023 09:32:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2fH-008MGG-1H
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:32:48 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64395e741fcso8602738b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683797567; x=1686389567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1t0ft/AfuKy/xQMa6et8iuTG4wcZxNYRj+6RIhEHQg=;
        b=ZUaERY7KluVgV1urVG9GVSmVHBH7RYw3PkzZILqQv6OpFvR3G0o+XmUalnrH8IQ+j1
         Dld0HaSegC5VzwsX/ArbewSGZylR9EndPFLvoCVz1Mg1jbxdQ7epp8zii7RdWkm35SJg
         BNQjs7CRuWUdnQKiOrTKt6agvRxoodPehag+MAe1oC9LAs/1wln+ppFKRK+l0JTPQ01O
         eZSCbFOiQWD5i+w7Ivhx+P3OFwoMpoG8ZhvfPj8JsWXU6jo29aI+XF6F/0bK0ahV+nPX
         qfy/an8GlvnmjWOvw4FzwQiBq/g/rue4OgSYOBZbZBCSFEki989DA6WOYUceaoLAm+wu
         TDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797567; x=1686389567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1t0ft/AfuKy/xQMa6et8iuTG4wcZxNYRj+6RIhEHQg=;
        b=LrNP+f+W6nt0nBNgeHj4RwstqKD2MbhUo7JFTpeUquDRTuhGv6FkNFnu2JfH65tzN6
         AcV2y++RDlg7OLSpK5diu8PrF3nEG7AKd6q9IH3WXAbTuvMesDyw+VT8bTtYDRuvRxjH
         TZbx80nMpRWuvSVk+QiUiX9Q0erZaS7HO6Y1E6HGPOLTWC7QMFbGfBPgaKxmFg8hF7vI
         AQurvQ8gL8tvbqj5r4fRTowHqhr4b8H6XvihVuNqrNvn7UXeX53tW7EwCb5ARpIHoq+D
         eTzoWjWJN1NYT3DmatisPdDiSmz9+3SRWH6pRhn+NpUMFAAYn9nED1oKV+RfxO6ywaUM
         OFvg==
X-Gm-Message-State: AC+VfDzokNV5/EIabQXqaBelmWU2dDYLwt3YD3/92SE9iwIkLpr59oOy
	V+mnkiemMp3GKmYQ2LJZqM4=
X-Google-Smtp-Source: ACHHUZ4lQ4MsoQ2H8y55dCOVIAxG2NxXuvFCeesI+ZlRh2pUdbfKc6WnStP0hclRyjW1MF7dIRuPOQ==
X-Received: by 2002:a05:6a00:1907:b0:643:b081:3428 with SMTP id y7-20020a056a00190700b00643b0813428mr25363263pfi.27.1683797567068;
        Thu, 11 May 2023 02:32:47 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id v16-20020aa78510000000b00627e87f51a5sm4875400pfn.161.2023.05.11.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 02:32:46 -0700 (PDT)
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
	e.shatokhin@yadro.com,
	bjorn@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH V10 1/4] riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Thu, 11 May 2023 17:32:31 +0800
Message-Id: <20230511093234.3123181-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230511093234.3123181-1-suagrfillet@gmail.com>
References: <20230511093234.3123181-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_023247_431781_2E5C997E 
X-CRM114-Status: UNSURE (   9.32  )
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
