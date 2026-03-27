Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A5E10ED677
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9oMpnhIAugmUbvshAGQWBdUIy9MViH2K0SXOsyTO5E=; b=oH5slTIW2dAKLD
	HCBP72xsTOSkK6ISnDlBaeNgDhpJMuzv5W6HVOPUbeCD6GVIPrHixuw6yWOWM6maQefFzLMxiPHZT
	naSydZxaH4kOjS/0N7ktS/Sdatw69pwYhQTKnt43RPcQLvNDUTksQzJHW68u+tO8LM1ZOD7W9CVoV
	hcKo107CNCFDjeLZrQu6eW34SbhyFvC2/b9mezoqzcgDUSJpsLlzllE7+mpCM0rLaIkQWQtkM2f1B
	LkKZ6zDrgPw0x+S972LgpaSQKGzICiiDpwZmRbQ5Yprn6AcvhO2qIHAwUineZbxRKAG2nABRbwoEW
	9SbNZdco+TbvBFxVvYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w673B-00000007QrF-1fKz;
	Fri, 27 Mar 2026 13:16:33 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6738-00000007Qps-1D2b
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 13:16:31 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-467e044082dso794192b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 06:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774617389; cv=none;
        d=google.com; s=arc-20240605;
        b=SNlpHd0qTNY6gPEShspJSptKmYXfAEqvC96bBQU8hGpnVK6pyv4k/5Ujo9keMRqGwH
         wIXTtUu2qvQkZ5Zc+mKN76GHNht+7pMFdo2nTKYTrMq5CNHvy/Hg1s44vSgHa73e7/rS
         L45ueYGLEAKMv+SwO6y8nD4EtN2+wSOeANUPBXADOCK7NnGz1VKDb7xx28in1yE2lXEp
         Xfbyig5VstUhLKCmV+kgi1xbycJkXosHB0pNyWq2qZboPW9INaDJjmsVXdf9E93c1TFN
         4fpmhWzuZKK5s/Gp+oV12OeB2fN2eZjFwW6oX+fX1zdRMTe+RUPMm36VsXyI1wf6plfD
         0rGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LxsmBS0GOSp0jQyHQNaHHHPYwd9SwbtGqsQ8nHJmtNM=;
        fh=fQgdVT0PMFf8Laew/9DlgUbIPNLYV6Xs2nAXX3ajoVA=;
        b=TbqNwpjFfiwbHay6Wc+hN8jwuiErDSh0cVDz0JzX52RXyPD8rDZ86ZhFbqZ/C8OfmP
         7NgK0HxjIsr0axHDuRd/TxI4onLd19jlhCxKeZmPZ7tt3CR8cMBUa4PC6JZhf4ipbz/v
         Q5Ihn5gkRMxR2wvwVznVmQUYFkp2yxaiwwM8kBc4X6Zwt5BWHymCq5CFrvI0yrtUFDYG
         RmAA8LNdMkLI1W6vCV2O78ReIPZPQKJgn82rG+IUSfX4EgYF1KlR5/kkQ+IdY1YlrzTc
         xEhA9sp+4qPKWFsRpsiTeAk9yk4yk0F4Kw8MVtHdi8zesU7ZqNQAAi96tJvlIloHL1L2
         tR1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774617389; x=1775222189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxsmBS0GOSp0jQyHQNaHHHPYwd9SwbtGqsQ8nHJmtNM=;
        b=2ZZ1ejMMSlT7q6m7uTFAoDg2VOpgvDhqnr1ihgJDFhRkm34RujPSxQTGVNKkTOGAEZ
         tKgGD3+jqKCLjelUELq8ZmwtSG5jJNiIxXaDNQz1yc8bTIrncLdVPCNATH4EqBe27Q9N
         PMDIEl6wpz3BsB+IfOsrXZRYqZqdu6WXi5DzX0fc2qdoYWA9LLjlyMDDmEyvWtUclrAv
         CddYulAjM8EP+JLNm3xvjd9tCydO5SUmsyK57EHsHN0i8gSbyymZeokmZr12/whIMTe+
         tLTh/7vYiQhZL50CmndJ6LMY3PRbr6t+OsMqQ0Oe0xjxFDi2XW7vYE2HeAArOcXEJjjP
         aAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617389; x=1775222189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxsmBS0GOSp0jQyHQNaHHHPYwd9SwbtGqsQ8nHJmtNM=;
        b=VijyqTkbxT2MHrDRqn0AFHhDxB2QM/oivOKX/0n9uK6bbv/P3JI0/6JvowMU57xMWT
         Nzys1wsJqq8GoGCiJtKTA2kG0ZvemvYhSxSS4HF8H7I/uoodxM9pu/fmSQL+NslTDhRw
         XmMrWl67odl5+y7RK959uKC5dX7QBp4itPDgtwASLmq7vY8mpIPVKJueBZXgXGqlMgx9
         877Lyzsnk4XmBc0AEHLbTnp+62XFxeZcKnj+M0K1McO+NBrPq0Q68Iw95IgyB7FHlmCt
         6d2ODaGhsT0gQrVqvjtNPq0YOhoUTBZp1y4UkUqE/QumQDsIvrxrpGDynHp3jPoVOsrg
         Dt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCURn2dzl7aeOHsJWhzdyJ0lZ1yDPBs8D6Xn0Fw8C1zXhijPLz7lv6sFWleY/IbbKX77GbeiOuONGmSC8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyask2WZUERxBe0dshxMR5O0DwLjpCdoX8+nRNK4f+W6DxSwlXj
	ANyO9AwwS/pd+vMqsNHMfa7RAJvu54RhUYdwn1tFoia8GzojhBo4mN2HptK/BgpiTquWtyB+prs
	ePMh8xeZJSU+ta3jGsVlmaVEcRPPhBuqenNY9tI2oRQ==
X-Gm-Gg: ATEYQzy1zJRuwyi+LyAxRx6K+dK61/fTp1gIWmnNtMBBdi/LK7Yv/bzpQh47kTTscNz
	LYulk3jGCU87LE/U8eVPOSDvSXIMHia6xhCo1Lbve1X3fWo/UTww24FwT3Dg9xViBmWwiNo4jxg
	lx2OeT6Pba28WmE3Bkyf8r5ogekFjTffFLyXNioBnW2+HIzJFjr8FhQ1IVdL5oIxlkxNqAcEF7R
	txTlp4cFbsnA5GldO9Hi7n/H2CEXUhxzn68dcMDCdL5UYsX3wpT1mO2C/FaVIZLHp1iDFVBRof6
	OqwaC7jpxNT8GKfIhpue+HUyHG5VaLn9HgcjzS8j+K0grA8Fh9Kc+Ut5aruD9pwnPO9QQQObQ1j
	5shOBd5iMaRKGQLb9MlalgNr8Hg==
X-Received: by 2002:a05:6808:4f29:b0:467:32c1:acf1 with SMTP id
 5614622812f47-46a8a574768mr975177b6e.39.1774617389039; Fri, 27 Mar 2026
 06:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260316151612.13305-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260316151612.13305-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:46:17 +0530
X-Gm-Features: AQROBzAiBWQwzRrAsNPun8GkheFgn7uHFWTVjZzHMuhgO-eFGjXm39iFGnN1dNM
Message-ID: <CAAhSdy1c=Bvso+ZCy_6a_1Bh8sznGDs9wErPQdqGWepgq8nQsg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: kvm: fix vector context allocation leak
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andybnac@gmail.com>, 
	Greentime Hu <greentime.hu@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_061630_350299_F309AC33 
X-CRM114-Status: GOOD (  16.06  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgODo0NuKAr1BNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1h
LmFiZGVsa2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIHNlY29uZCBremFsbG9j
IChob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwKSBmYWlscyBpbgo+IGt2bV9yaXNjdl92Y3B1X2Fs
bG9jX3ZlY3Rvcl9jb250ZXh0LCB0aGUgZmlyc3QgYWxsb2NhdGlvbgo+IChndWVzdF9jb250ZXh0
LnZlY3Rvci5kYXRhcCkgaXMgbGVha2VkLiBGcmVlIGl0IGJlZm9yZSByZXR1cm5pbmcuCj4KPiBG
aXhlczogMGY0YjgyNTc5NzE2ICgicmlzY3Y6IEtWTTogQWRkIHZlY3RvciBsYXp5IHNhdmUvcmVz
dG9yZSBzdXBwb3J0IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IE9zYW1hIEFiZGVsa2FkZXIgPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwuY29tPgoKUXVldWVk
IHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMQoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IHYyOgo+IC0g
QWRkIEZpeGVzOiB0YWcKPiAtIEFkZCBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBp
bmRleCAwNWYzY2MyZDhlMzEuLjViNmFkODJkNDdiZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+
IEBAIC04MCw4ICs4MCwxMSBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRl
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKPgo+ICAgICAgICAgdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwID0ga3ph
bGxvYyhyaXNjdl92X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiAtICAgICAgIGlmICghdmNwdS0+YXJj
aC5ob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwKQo+ICsgICAgICAgaWYgKCF2Y3B1LT5hcmNoLmhv
c3RfY29udGV4dC52ZWN0b3IuZGF0YXApIHsKPiArICAgICAgICAgICAgICAga2ZyZWUodmNwdS0+
YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCk7Cj4gKyAgICAgICAgICAgICAgIHZjcHUt
PmFyY2guZ3Vlc3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBOVUxMOwo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0K
PiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
