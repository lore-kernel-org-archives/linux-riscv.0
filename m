Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C9AEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FUnQ3Bls7Bnb+n+LmtE7nvSI33oCFeep6TcW3QDCxF0=; b=fCcI68EniAtDtC5dKvZsuE1jVJ
	SQs9PyJEZplMnTDJQIDAxbAUF+/xsH09kFklqmfGTOliiWmT6UxWC3hM9Saqutr66XH1DqeJN2Ihp
	MbJ49gdUWSOo9WW3aZLne8JbAwbW6qkJKP1kp6Eu2DG/YSl5SWHoTtFgxeVNSvZwT6foHt/89pSaY
	v1nhQq8700J8Q0AWnASK+ziQAMlvvObLeCUL3JezdiR8H6DYM4NyzSLnzSm+4pVh4iqhHbGvcFwVe
	fzsAjZcOFKrPC/XRQPhbKaAJnuDuluQVj64O9GR7n7EwNh9ZpWGBIfyEG6FFb0aPCxO1EGPPmAdgh
	HiJvdjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWPW-008eKN-2G;
	Sun, 25 Jun 2023 20:32:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWPT-008eJF-15
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 20:32:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b7f68f1c9eso7941035ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687725153; x=1690317153;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBlgshKH4iHZ6ZOz7biqH9hQXuaMYrjJzSIAurqMODo=;
        b=VgoYcJiDCA9DGjSnUwAzXIFvDLuky8NaN2eHCiI+14pkYfHQhIkbKIFbryfcUXDa+L
         Z+bfDkfwoFxG4yexzX9URk15JpC/YPxlTGeekdSB1gPW+Fbyi3Dl2bj3Y1I3ZzSs2kat
         /J0dW3iKdPSPIB4Spi5Yc+1clsviISldE/Ul/inCWn2ukasVlEg7rJHFLhO7SAOhDfNu
         efMPQX+HXaE11g5YtDTEI/jar6fGqau+HXCw9Ixt9Bpf8vIQpvGdBP7oFAmf6cJqXvhc
         Ct2ZlEqBV+kpRtSGM0wXYFQH6ljp3Gl3ubnO8TGwvzr0DVC6M2e+jjWK6GDbWufbb48I
         DDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687725153; x=1690317153;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBlgshKH4iHZ6ZOz7biqH9hQXuaMYrjJzSIAurqMODo=;
        b=cGzwAdp+qgloIgXqGzR9InbtjVo35mtO6tYhmc9xSL4SaWvlrjS8E52fIe3ehGY39d
         PrFajW5ktpGX5aRtKg3yMcjYK8jsfzrrqtP6w4Mpi/jd+AtVyvBPXMcC2AhE0A2fi8Ui
         ELiH50cvgUMAeNU+suXK1KVNnVkqHHv9H8WDitY57D986BKr86yMoNbAZCoRw9xh91wY
         cdA4UdDHiYJb1IcQRELi2xPWZbo5pllfQx85ZZKacLkLwXQzESvycBjklR/c5SGVdQXq
         DCCroWkbeuv+9ktNoptWaaGeBcO+wcwW1JpaxjA399bHdFMV+j7QNxVKUVcZ714hxafg
         /B1g==
X-Gm-Message-State: AC+VfDyob5tNUonVCX6e6W9Qou5xSqKzLxgVupQ5Y//k9TLmmfNDhuI9
	Q9P2RTPHRFlgSEypPHYgSX/9dA==
X-Google-Smtp-Source: ACHHUZ6bcYS4/UaX8iSXpyadxQeExPfzsfqR9xq6pFt1YaUiqNjuA8+0Ohu9fS4bWAErBSH48Qjuiw==
X-Received: by 2002:a17:903:2306:b0:1b0:7123:6ee8 with SMTP id d6-20020a170903230600b001b071236ee8mr6606809plh.61.1687725153095;
        Sun, 25 Jun 2023 13:32:33 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jm23-20020a17090304d700b001b51b3e84cesm2808774plb.166.2023.06.25.13.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:32:32 -0700 (PDT)
Date: Sun, 25 Jun 2023 13:32:32 -0700 (PDT)
X-Google-Original-Date: Sun, 25 Jun 2023 13:31:47 PDT (-0700)
Subject: Re: [PATCH V10 4/4] samples: ftrace: Add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]
In-Reply-To: <CAAYs2=hd1geHCTGrO=JohTYtgu+yj+D7EPono-ADOGfjYnLfrA@mail.gmail.com>
CC: rostedt@goodmis.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>, guoren@kernel.org,
  jszhang@kernel.org, e.shatokhin@yadro.com, Bjorn Topel <bjorn@rivosinc.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: suagrfillet@gmail.com
Message-ID: <mhng-29a592bf-1b25-4c6c-8f37-0d05d39bc093@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_133235_382222_3908710A 
X-CRM114-Status: GOOD (  20.66  )
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

T24gVHVlLCAxNiBNYXkgMjAyMyAwMjozNzo1MyBQRFQgKC0wNzAwKSwgc3VhZ3JmaWxsZXRAZ21h
aWwuY29tIHdyb3RlOgo+IFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2RtaXMub3JnPiDkuo4y
MDIz5bm0NeaciDE15pel5ZGo5LiAIDE4OjM35YaZ6YGT77yaCj4+Cj4+IE9uIFRodSwgMTEgTWF5
IDIwMjMgMTc6MzI6MzQgKzA4MDAKPj4gU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29t
PiB3cm90ZToKPj4KPj4gPiBzZWxlY3QgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVCBhbmQgSEFW
RV9TQU1QTEVfRlRSQUNFX0RJUkVDVF9NVUxUSQo+PiA+IGZvciBBUkNIX1JWNjRJIGluIGFyY2gv
cmlzY3YvS2NvbmZpZy4gQW5kIGFkZCByaXNjdiBhc20gY29kZSBmb3IKPj4gPiB0aGUgZnRyYWNl
LWRpcmVjdCouYyBmaWxlcyBpbiBzYW1wbGVzL2Z0cmFjZS8uCj4+ID4KPj4gPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jNjhiYWM4My01Yzg4LTgwYjEtYmFjOS1l
MWZkNGVhOGYwN2VAeWFkcm8uY29tL1QvI21hMTMwMTI1NjAzMzFjNjZiMDUxYjU4MGIzYWI0YTA0
YmE0NDQ1NWVjCj4+ID4gVGVzdGVkLWJ5OiBFdmdlbmlpIFNoYXRva2hpbiA8ZS5zaGF0b2toaW5A
eWFkcm8uY29tPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdt
YWlsLmNvbT4KPj4gPiBUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+PiA+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+PiA+IEFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+ID4gLS0tCj4+ID4gIGFyY2gv
cmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+PiA+ICBzYW1w
bGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LW1vZGlmeS5jICAgICAgIHwgMzQgKysrKysrKysrKysr
KysrKysrCj4+ID4gIHNhbXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtbXVsdGktbW9kaWZ5LmMg
fCA0MCArKysrKysrKysrKysrKysrKysrKysKPj4gPiAgc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRp
cmVjdC1tdWx0aS5jICAgICAgICB8IDI0ICsrKysrKysrKysrKysKPj4gPiAgc2FtcGxlcy9mdHJh
Y2UvZnRyYWNlLWRpcmVjdC10b28uYyAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrCj4+ID4g
IHNhbXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QuYyAgICAgICAgICAgICAgfCAyMyArKysrKysr
KysrKysKPj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBJIGFj
a2VkIHY4ICh3aGljaCB5b3Ugd2lsbCBuZWVkIG15IGFjayB0byBnZXQgdGhlc2UgaW4pLiBVbmxl
c3MgdGhpcyBwYXRjaAo+PiBjaGFuZ2VkIHNpbmNlIHY4LCB5b3Ugc2hvdWxkIGluY2x1ZGUgbXkg
YWNrIGluIGZ1cnRoZXIgdmVyc2lvbnMuCj4+Cj4gVGhlcmUgd2VyZSBubyBjaGFuZ2VzIGluIHRo
aXMgcGF0Y2gsIGV4Y2VwdCBmb3IgYSBmZXcgdGFiIHByZXR0aWVzIHNpbmNlIHY4Lgo+IHlvdXIg
QWNrZWQtYnkgd2lsbCBzdGlsbCBiZSBpbmNsdWRlZC4KPj4gT3IgeW91IG1heSBiZSB3YWl0aW5n
IGxvbmdlciBmb3IgaXRzIGFjY2VwdGFuY2UuCj4+Cj4+IElmIHRoZSBwYXRjaCBkaWQgY2hhbmdl
LCBwbGVhc2UgYWNrbm93bGVkZ2UgdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9uIChvcgo+PiB0aGlz
IG9uZSBpZiBpdCBkaWQgY2hhbmdlKSwgYXNraW5nIG1lIHRvIGFjayBpdCBhZ2Fpbi4KClRoZSBz
YW1wbGVzIGZhaWwgdG8gYnVpbGQgb24gcnYzMiwgdGhleSdyZSBydjY0LXNwZWNpZmljLiAgSSB0
aGluayAKc29tZXRoaW5nIGxpa2UgdGhpcyBzaG91bGQgZG8gaXQKCmRpZmYgLS1naXQgYS9zYW1w
bGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LXRvby5jIGIvc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRp
cmVjdC10b28uYwppbmRleCA1YzMxOWRiNDhhZjIuLjM3MDdjNDQ3YTQyZCAxMDA2NDQKLS0tIGEv
c2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRpcmVjdC10b28uYworKysgYi9zYW1wbGVzL2Z0cmFjZS9m
dHJhY2UtZGlyZWN0LXRvby5jCkBAIC0yNCwxOSArMjQsMTkgQEAgYXNtICgKICIgICAgICAgLnR5
cGUgICAgICAgICAgIG15X3RyYW1wLCBAZnVuY3Rpb25cbiIKICIgICAgICAgLmdsb2JsICAgICAg
ICAgIG15X3RyYW1wXG4iCiAiICAgbXlfdHJhbXA6XG4iCi0iICAgICAgIGFkZGkJc3Asc3AsLTQw
XG4iCi0iICAgICAgIHNkCWEwLDAoc3ApXG4iCi0iICAgICAgIHNkCWExLDgoc3ApXG4iCi0iICAg
ICAgIHNkCWEyLDE2KHNwKVxuIgotIiAgICAgICBzZAl0MCwyNChzcClcbiIKLSIgICAgICAgc2QJ
cmEsMzIoc3ApXG4iCisiICAgICAgIGFkZGkJc3Asc3AsLTgqU1pSRUdcbiIKKyIgICAgICAgUkVH
X1MgCWEwLDAqU1pSRUcoc3ApXG4iCisiICAgICAgIFJFR19TIAlhMSwxKlNaUkVHKHNwKVxuIgor
IiAgICAgICBSRUdfUyAJYTIsMipTWlJFRyhzcClcbiIKKyIgICAgICAgUkVHX1MgCXQwLDMqU1pS
RUcoc3ApXG4iCisiICAgICAgIFJFR19TIAlyYSw0KlNaUkVHKHNwKVxuIgogIiAgICAgICBjYWxs
CW15X2RpcmVjdF9mdW5jXG4iCi0iICAgICAgIGxkCWEwLDAoc3ApXG4iCi0iICAgICAgIGxkCWEx
LDgoc3ApXG4iCi0iICAgICAgIGxkCWEyLDE2KHNwKVxuIgotIiAgICAgICBsZAl0MCwyNChzcClc
biIKLSIgICAgICAgbGQJcmEsMzIoc3ApXG4iCi0iICAgICAgIGFkZGkJc3Asc3AsNDBcbiIKKyIg
ICAgICAgUkVHX0wgCWEwLDAqU1pSRUcoc3ApXG4iCisiICAgICAgIFJFR19MIAlhMSwxKlNaUkVH
KHNwKVxuIgorIiAgICAgICBSRUdfTCAJYTIsMipTWlJFRyhzcClcbiIKKyIgICAgICAgUkVHX0wg
CXQwLDMqU1pSRUcoc3ApXG4iCisiICAgICAgIFJFR19MIAlyYSw0KlNaUkVHKHNwKVxuIgorIiAg
ICAgICBhZGRpCXNwLHNwLDgqU1pSRUdcbiIKICIgICAgICAganIJdDBcbiIKICIgICAgICAgLnNp
emUgICAgICAgICAgIG15X3RyYW1wLCAuLW15X3RyYW1wXG4iCiAiICAgICAgIC5wb3BzZWN0aW9u
XG4iCgpwcm9iYWJseSBmb3IgYWxsIG9mIHRoZW0uICBEbyB5b3UgbWluZCBzZW5kaW5nIGEgdjEx
IHdpdGggdGhhdCBmaXhlZD8gIAoKPj4KPj4gLS0gU3RldmUKPgo+Cj4KPiAtLSAKPiBUaGFua3Ms
Cj4gU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
