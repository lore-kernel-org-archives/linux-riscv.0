Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBDBFCC9AA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 02:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0mnPlM2UgaDMJVBr/LHW4BcGHBFkrM0SZFVDFh368Y=; b=2dV8kZkoj09hlSBxy/ixWUoHZX
	Dt1Ukf18HSYgGmOkrt93fmQmRKVOdEHCRyOTiZR0SrnGG9ZlaF09WLH45T8PCbBh+4ROKyM2g+Hta
	DUn9q+6rK7WFOnOPeUjEiqkF6i1j1rLfK205618BW4JXZC613AXaKH2f/1Q6MddxPZeWxtcy4INFB
	tnmqA/wJFbFA5O1Bx3K4DypFusRJZ9u3QwvAy+TBe64/9SuwMAgkSGVLyxJ1L1+h/LXXS+VpRWtRI
	l57ANsN7EGzq9EiSueEzXJ06ViKju2GCtBXElfmKN7xpQdps/vRoG2PZ/FAOIA18Lvv1sv67uAq9f
	6fAjtTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznJ6-00000008bO4-2Tj4;
	Tue, 10 Mar 2026 02:58:52 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznJ4-00000008bNG-1lyk
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 02:58:51 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-127380532eeso810956c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 19:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1773111530; x=1773716330; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mcX55qyR+PnOq0AxxdFtVjRyud0Rj+p4rJPW0KkjK4=;
        b=FumjSIZycylEkl8k6XlI86w7eBGoeWAVEcsmTY4LExaVahkgX7qv+pTNqC4uQc+tgf
         iPD0Uysw5EF6d/jcr35U8DuN1fNqnMAyEKQzI7Uz6HacaQd6XEI1gtD3dqcx4TG10ZxP
         Y5g+DhmcCNDBbywZh8MMc1OwPXIK37rbVEe2BbC0aJqzjuvmCtNYV3jPC+KxgTWgkO2U
         i0sxhK0SM4RFulg4EvBzh0TWzx8tmvU4PiktShiDFMV51ybealeUn31DGyndLOBAhgNe
         930uUEWk3vwqw1HNheYnAKOAQNzw4IqySCqclaisAnlBKZHpZqgTK/YsY7HWa1sy097v
         /o2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111530; x=1773716330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mcX55qyR+PnOq0AxxdFtVjRyud0Rj+p4rJPW0KkjK4=;
        b=bexdjGJ7siA6IXm+Z8QqFyd5TvPVBtvwRZN3KhHYgK8qVGwPjBf4h/Rz0PPZoPs/pQ
         DIKn5LSlLphmNcBpCvQ+BzVkMoeyXIluUwWt3wO3n6CepBK+4IMyZ0DZ9v6m0DQ5gLnC
         7fWjF//1T6pR7Y3XBvyS0QpdJi6pw6mG3BtLSQ56DpnCxImlCmLa9E+eDV8HzzA3mQBF
         7071yqA8KMbiC9gFjwBej0bKPLYrkqmLC3ZjACX6RuZyC3vxCbZncfiMPI4PZ6VlkR5p
         RF6KukuF2LGjey6EIch19FIIvc7VX95QjG0HUEijP0dlGeGLd61Q9Ef1DP8xHKCpgrl7
         iyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOQ9o/bPCKnfz6JAy29YH52Cqcxp0verndc4iEQ4RnrEBBJBBR79i1zlcaK2f6IBg9XJWtMsHgr3ze/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsGi4CbvMjFqZe5xZwATa1RaoPt92oy1nJIPEEupnvRzXhYKCU
	OJton2amErtjYuCW6T3vY6bHvK33vFl9VNLEnAvcgJctjE8+B1B4YA6j+XAD0EDDoYE=
X-Gm-Gg: ATEYQzzBAWxaUVawjpwjsX+4WhgBlbKhG6JArS8p1XXmwbuySwalIG8oICy6NssoGZ4
	eBUFkDb2cVF3TxRX7s/ZrEaHm+Mwhp1fcn4Ar8YuulXLZkyPqDvBXFtvTGa80fyXKJMWQEBpTZA
	VF58TebHTbw7Ep9aq/EHZKhE/6inUU4P40n1m6RJsVIq0DaMk63aZEHDkEgauePrhyUaVlq8bSk
	MZsemcSiG3+yqNQnntiJzb8s2Ma/2Z4nhUtEl1FZmcH5GRP0nwO00KrhSWyCcrvrU89bC+ueA53
	+F8e1gLo+6NoQeTEodUZJr/yMNS7Ohr4X8ihoyR63PSnYHUdhdjfv+3w/Uall33AY8DODKpF4Nl
	RCX/2zRJTjIh40YO7QaKUGL+ZJNqtN34A9jy1HQxrcXpmXpBaXcON/gvfynrNCNpNGSQMhOGW+p
	o5CUmIfAEaoxaGJjLrW5XHEuEfrZT3CKJX
X-Received: by 2002:a05:693c:2c96:b0:2bd:c883:5f8c with SMTP id 5a478bee46e88-2be4e08b1e2mr5642589eec.36.1773111529870;
        Mon, 09 Mar 2026 19:58:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f9836b6sm11352483eec.31.2026.03.09.19.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:58:49 -0700 (PDT)
Date: Mon, 9 Mar 2026 19:58:47 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Andy Chiu <andybnac@gmail.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] riscv: ptrace: Fix BIT() compilation issues
Message-ID: <aa-I56-dJKtdmr6V@debug.ba.rivosinc.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_195850_461087_73A8DE17 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMDksIDIwMjYgYXQgMDY6NTI6MTJQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5z
IHZpYSBCNCBSZWxheSB3cm90ZToKPkZyb206IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2pl
bmtpbnNAZ21haWwuY29tPgo+Cj5CSVQoKSBpcyBiZWluZyB1c2VkIGluIHB0cmFjZS5oIHdpdGhv
dXQgYSBkZWZpbml0aW9uLCByZXN1bHRpbmcgaW4KPmNvbXBpbGF0aW9uIGVycm9ycyBpbiB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvY2ZpdGVzdHMuYzoKPgo+Y2ZpdGVzdHMuYzox
MDE6NjA6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhCSVTigJkg
Wy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gIDEwMSB8ICAgICAgICAgICAgICAg
ICAgICAgIGlmICgoY2ZpX3JlZy5jZmlfc3RhdHVzLmNmaV9zdGF0ZSAmIENGSV9FTkFCTEVfTUFT
SykgIT0gQ0ZJX0VOQUJMRV9NQVNLKQo+Cj5JbmNsdWRlIGxpbnV4L2JpdHMuaCB0byByZXNvbHZl
IHRoaXMgaXNzdWUuCj4KPkZpeGVzOiAyYWY3YzljZjAyMWMgKCJyaXNjdi9wdHJhY2U6IGV4cG9z
ZSByaXNjdiBDRkkgc3RhdHVzIGFuZCBzdGF0ZSB2aWEgcHRyYWNlIGFuZCBpbiBjb3JlIGZpbGVz
IikKPlNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21h
aWwuY29tPgoKUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgoK
Cj4tLS0KPiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggfCAxICsKPiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJh
Y2UuaAo+aW5kZXggMTg5ODhhNWYxYTYzLi41YjUzY2VhMTQzNTUgMTAwNjQ0Cj4tLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKPisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9wdHJhY2UuaAo+QEAgLTgsNiArOCw3IEBACj4KPiAjaWZuZGVmIF9fQVNTRU1C
TEVSX18KPgo+KyNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4gI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+Cj4KPiAjZGVmaW5lIFBUUkFDRV9HRVRGRFBJQwkJMzMKPgo+LS0gCj4yLjUyLjAKPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
