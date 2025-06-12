Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0564AC71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJ0yCHepbJ9q7ka8MQlfDA5GW7uy6Oi6GIU8r+ToBBU=; b=kDiGKcynwkWDOc
	PDJhCSjXk/sadf4orwtNQqTYoCrCSdE2bBymIrYgppkPV10oM6ZMw1+BwCvp+Wt9F2NX9QvlBHTax
	qgGaDcDXSN7O3UmdC+YY46L+KsWLtHEdEm0sqT7AAnaZkAsqzner/N5eC1nDlCQIJTfA7jy9T+YSt
	I73WoYjNFbHJ9ke/ZY90E07vzJE+/5CsL6rDJhaF5ewTQW5oH39MOkp9KVQko5GL3bZl7HgNJXiC+
	y5vRvJTy2RsvfwWCvZzl9cj1bjAEQx/J5M4pXrR49eYgmGVmL3i6YYKA0bA6/3T+lWDcOjE5e5f62
	W2tOqpxVzPWXBx3BJrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoSb-0000000EUKh-1KJy;
	Thu, 12 Jun 2025 20:23:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoMA-0000000ETxV-26Fh
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:17:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-235ca5eba8cso51045ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749759421; x=1750364221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzEGZoiP4K4QOUbppiftlDAe5J+ee4W3KdfcExHtN30=;
        b=vzaPb8UF3iSQhQc7pDwMo3rf+cx0jM7614ScMQjSvdW2PNdiXrFgSkIwOJgDUO6uhr
         CLQucsyP7DTdn6J+DNhoBPV+JsWovnEoTV8rYL7nvNrYSuPdYK84hY5VRzpJ84skIkfT
         4SdDZH4dblFFfGXxBv95Vm9EMM0c+7blac07TCiy++lrHDRwC5erBsSDEWMqhKlxvdLH
         V41fn8FCCE8o+Cg6N2n1H9uifY8ez8lNJpyuEy77ATGK0JEXuV1AHA3DJ0SAC4yMIfHa
         hWELPbe7IisfVBpeOHjKLU+zeIHzyv2x2K9kvAd3tnSJKDhSf6gFMt5sWbh/QLlzHx5v
         wPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749759421; x=1750364221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzEGZoiP4K4QOUbppiftlDAe5J+ee4W3KdfcExHtN30=;
        b=e7veIhsNtqjRLGKvBfKrjXK2nkHjnADcbbSCIL1acY8Xv+yZokQJfbdXlaojnpk7Fq
         rNUo5tGlSnMtNAjCkMkvDR7lgPKes5xPnYkc8dNxmXD7CbPEQMiNWeFJz/was0H4WX9w
         uEGfKKewsi+JVFokWDGL8r/3WAvx9d+K/aiaDdMPcRFgHnBKUy2/Hjp1Z9PyLz4thbQk
         hYn15kbAYjSnN0eN/BJ9KthgPThsb7K81WIVRhVucidd0ZTTAiuCgg94xN4+hh1D+DRR
         sADqU+B7GAtwxrjF43gR1m8WdCJNnOEh921zhProWxO9iOMjQHau9U46qhl5psh9nUe2
         3sXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUedSUoXnlPZEyBdu1nvSmKs+P5f4Ew/I4GAlySR5gDKM5Ogo4hgS3j1Rv8l9HUVFa/HJV4YHirZ5oq6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbSSsXM4rhSRBlG9TZXTTfu7yfBRMfp7dDqoXWaKki0sIdLNwE
	232yLjzc8pGYYEvvcNKTinG1XksHm644qsk4pXnzQHAct20yKvFJAt7WzvyutuQd0tOXJG4WOO5
	AWW6HCpDSpbfnGbjP75my8Wqj3SzOBmbrKWyK+1WN
X-Gm-Gg: ASbGncvFbIFXZXYv/pKlvZvxkOPkiUjJ1wdFM+8LG1SIXS7iJekowK8+EJilFP8oS8C
	LPs7EzBi0z1QsbDcgASJ5zX/efxoEvfzl57BmAzMnZ6UdZmgZiNI9mJCyLwM/TVWcxCbMuhhyMc
	c+6rkOio/CWwnAaY5BvgTeVpytWJCP9koaPU6uNEGZ
X-Google-Smtp-Source: AGHT+IHFrAXcJTnxqKVck9VUMcfEAPekbj5iqtQKGqGzarrcDrNUw7XtTgYP0mxzcfkiDTg8Uo8HWgSeNcMW9sqlrc4=
X-Received: by 2002:a17:903:f90:b0:216:7aaa:4c5f with SMTP id
 d9443c01a7336-2365ec46e31mr233195ad.3.1749759420695; Thu, 12 Jun 2025
 13:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-riscv-require-clang-17-for-kcfi-v1-1-216f7cd7d87f@kernel.org>
In-Reply-To: <20250612-riscv-require-clang-17-for-kcfi-v1-1-216f7cd7d87f@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 12 Jun 2025 13:16:23 -0700
X-Gm-Features: AX0GCFuTAMmgTyQd3wuTrHKylYFTPTbhhknJpwyhNHmJXUMP1DlwFarGGXztZ_c
Message-ID: <CABCJKudMSzrYj3Np4cxoe6WQ-8Wu1jbG84LMmtGdqA-v3FmAPg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Require clang-17 or newer for kCFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_131702_536157_A45AB90B 
X-CRM114-Status: GOOD (  14.53  )
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

SGkgTmF0aGFuLAoKT24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgMTI6NTfigK9QTSBOYXRoYW4gQ2hh
bmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWZ0ZXIgdGhlIGNvbWJpbmF0
aW9uIG9mIGNvbW1pdCBjMjE3MTU3YmNkMWQgKCJyaXNjdjogSW1wbGVtZW50Cj4gSEFWRV9EWU5B
TUlDX0ZUUkFDRV9XSVRIX0NBTExfT1BTIiksIHdoaWNoIHN0YXJ0cyB1c2luZwo+ICctZnBhdGNo
YWJsZS1mdW5jdGlvbi1lbnRyeT1NLE4nLCBhbmQgY29tbWl0IGQwMjYyZTkwN2UyOSAoInJpc2N2
Ogo+IGZ0cmFjZTogc3VwcG9ydCBQUkVFTVBUIiksIHdoaWNoIGFsbG93cyBDT05GSUdfRFlOQU1J
Q19GVFJBQ0UgdG8gYmUKPiBlbmFibGVkIGJ5IGFsbG1vZGNvbmZpZywgYWxsbW9kY29uZmlnIGJ1
aWxkcyB3aXRoIGNsYW5nLTE2IGJlZ2luCj4gY3Jhc2hpbmcgaW4gdGhlIGdlbmVyaWMgTExWTSBr
Q0ZJIHBhc3MgKHNlZSBbMV0gZm9yIHRoZSBzdGFjayB0cmFjZSkuCj4KPiBjbGFuZy0xNyBhdm9p
ZHMgdGhpcyBjcmFzaCBieSBtb3ZpbmcgdG8gdGFyZ2V0LXNwZWNpZmljIGxvd2VyaW5nIG9mIHRo
ZQo+IGtDRkkgb3BlcmFuZCBidW5kbGVzIFsyXS4gUmVxdWlyZSBjbGFuZy0xNyB0byBzZWxlY3Qg
Q09ORklHX0NGSV9DTEFORyB0bwo+IGF2b2lkIHRoaXMgY3Jhc2guCj4KPiBGaXhlczogYzIxNzE1
N2JjZDFkICgicmlzY3Y6IEltcGxlbWVudCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9P
UFMiKQo+IExpbms6IGh0dHBzOi8vZ29kYm9sdC5vcmcvei94RzM5UG4xNm8gWzFdCj4gTGluazog
aHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC82MmZhNzA4Y2ViMDI3
NzEzYjM4NmM3ZTBlZmRhOTk0ZjhiZGMyN2UyIFsyXQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBD
aGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmln
IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+IGluZGV4IDM2MDYxZjQ3MzJiNy4uZDcxZWEwZjQ0NjZmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC02Myw3ICs2Myw4
IEBAIGNvbmZpZyBSSVNDVgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfT1BUSU9OQUxfS0VSTkVMX1JX
WF9ERUZBVUxUCj4gICAgICAgICBzZWxlY3QgQVJDSF9TVEFDS1dBTEsKPiAgICAgICAgIHNlbGVj
dCBBUkNIX1NVUFBPUlRTX0FUT01JQ19STVcKPiAtICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRT
X0NGSV9DTEFORwo+ICsgICAgICAgIyBjbGFuZyA+PSAxNzogaHR0cHM6Ly9naXRodWIuY29tL2xs
dm0vbGx2bS1wcm9qZWN0L2NvbW1pdC82MmZhNzA4Y2ViMDI3NzEzYjM4NmM3ZTBlZmRhOTk0Zjhi
ZGMyN2UyCj4gKyAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19DRklfQ0xBTkcgaWYgQ0xBTkdf
VkVSU0lPTiA+PSAxNzAwMDAKPiAgICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0RFQlVHX1BB
R0VBTExPQyBpZiBNTVUKPiAgICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0hVR0VfUEZOTUFQ
IGlmIFRSQU5TUEFSRU5UX0hVR0VQQUdFCj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19I
VUdFVExCRlMgaWYgTU1VCgpMR1RNLiBUaGFua3MhCgpSZXZpZXdlZC1ieTogU2FtaSBUb2x2YW5l
biA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+CgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
