Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3466BC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chmYOaoROGv/j0qkVJD0JLES2PC1HIceZpSh2/s/lA8=; b=bmep5N78x9BdVT
	ky+zkVU9qj37lPmii1z8O0dclIvUBQaJGX1YOGduttsTzUUp5mPyol6hFAajgJH9zRk4mRrkQg9xD
	bDpw2ADes5Q4Xf1pd45LN4t13J6kjSlGI75SRkcvo/V8LzBTIDvRDBmVHadDHXhhYRHmMj3V9XfgW
	5Y12SjAAeMDdcd/7Z4/6cFdUzYJQBnW9Kvo1HrvIQFVEWqff4fpvavFlk0T1oNuWg9y/dCTd3jj84
	icTvcl2XW2cz3e/NwQ0Tfn7N3wTN7L9UiWVStGyrqahpwVzp7rzWKRpaOpgE5xSSPavfdUSnyUW6o
	E/3ECl952qpQ1uEvjZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Bt3-00Fv3i-2F;
	Mon, 05 Jun 2023 15:12:49 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Bsz-00Fv1n-1b
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:12:47 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-777b46516ddso52010239f.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685977953; x=1688569953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k0AVfITaexd+O/8Zvhrtfpxkbv78ZJrYCvg9tdq3pU0=;
        b=pTRTTtTQ9D8lHog2KMH5n1WXsp/Avd08i2w30yEARIxzr8ULMc+wCM3/fPo3OMGAoR
         n5VaXzmIomVe9Y06XL5pn58AalI49hmn1VFVQ9PGZ3fGs4cjtEQo67PZd+hthlmqiRY5
         GE0EFzmk6gXXMPZC7Yr7vecDCKZKqV0ALG43JtfXTlJZoIU69HpNYYuoknFF+te5sOQU
         RDPSXvAHUSWpsVbVd9M/a8QsulFPTlRDs+JWZnYVzt6CrhCQKNCgi6WWIEc/gb2Xqc9L
         5R5Q8JbbCFvSGKpT7XAgSzw4b0zw8PxIh+Em+mpfXfHEQ+75vhbf4bOLUmWAlACW1UMD
         sXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685977953; x=1688569953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0AVfITaexd+O/8Zvhrtfpxkbv78ZJrYCvg9tdq3pU0=;
        b=Gn67/AqXREL3Kf6bZNBNJhrw8KtI9vYbBfNCdO+TBJYx73pOAoOKe6zP+q25lB51tM
         i+kZ+XGUfdH/yumo0QV/ht5eR11GajXDUSdArJd35Rx9LStTrbU86tWS/1Ozl8vAHNxK
         QP0EYGDMXfhjm8JT4k26PfW96bWQCsg5t+PmiuWXV+ZAr7Lyci0Snz+KUOcyRYLWb8uT
         M7ChTFE5tD5L/SBG3pnAY3L4oIJsBvQ1I5wUoPHB0hjLBRBeltaMEW8hz731Yw1/XYSo
         pGu815qXQZQtLO438M16bN0joWhOHdETtRutwnghqIh4u5N+wZyLl0MGzwES9QF21zAs
         ICew==
X-Gm-Message-State: AC+VfDwnwHi5x+kMNlEtDUF60EuKqH7VSzPxD9n+9rKkW6fAGolUkrlb
	EViEvCKXUPsiv6J0JG8Y9SDSvw==
X-Google-Smtp-Source: ACHHUZ59a2PNnpeAHGWsZsfwYG8+T7rs/U6QySUhlzItBA4G7E2PL3GQvP6c8vx4PpUN6OQz02TwYA==
X-Received: by 2002:a92:ad05:0:b0:328:a646:8bf5 with SMTP id w5-20020a92ad05000000b00328a6468bf5mr87728ilh.27.1685977952922;
        Mon, 05 Jun 2023 08:12:32 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id s15-20020a17090a764f00b0024de0de6ec8sm6063564pjl.17.2023.06.05.08.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:12:32 -0700 (PDT)
Date: Mon, 5 Jun 2023 20:42:24 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Song Shuai <songshuaishuai@tinylab.org>, robh <robh@kernel.org>,
	ajones <ajones@ventanamicro.com>, anup <anup@brainfault.org>,
	palmer <palmer@rivosinc.com>,
	"jeeheng.sia" <jeeheng.sia@starfivetech.com>,
	"leyfoon.tan" <leyfoon.tan@starfivetech.com>,
	"mason.huo" <mason.huo@starfivetech.com>,
	"paul.walmsley" <paul.walmsley@sifive.com>,
	"conor.dooley" <conor.dooley@microchip.com>,
	guoren <guoren@kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Bug report: kernel paniced while booting
Message-ID: <ZH37WMnx/rYSRF/o@sunil-laptop>
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
 <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_081245_553811_FA4183D5 
X-CRM114-Status: GOOD (  36.40  )
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

T24gTW9uLCBKdW4gMDUsIDIwMjMgYXQgMDQ6MjU6MDZQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IEhpIFNvbmcsCj4gCj4gT24gTW9uLCBKdW4gNSwgMjAyMyBhdCAxMjo1MuKAr1BN
IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnPiB3cm90ZToKPiA+Cj4gPiBE
ZXNjcmlwdGlvbiBvZiBwcm9ibGVtOgo+ID4KPiA+IEJvb3RpbmcgTGludXggV2l0aCBSaXNjVlZp
cnRRZW11IGVkazIgZmlybXdhcmUsIGEgU3RvcmUvQU1PIHBhZ2UgZmF1bHQgd2FzIHRyYXBwZWQg
dG8gdHJpZ2dlciBhIGtlcm5lbCBwYW5pYy4KPiA+IFRoZSBlbnRpcmUgbG9nIGhhcyBiZWVuIHBv
c3RlZCBhdCB0aGlzIGxpbmsgOiBodHRwczovL3Rlcm1iaW4uY29tL25nYTQuCj4gPgo+ID4gWW91
IGNhbiByZXByb2R1Y2UgaXQgd2l0aCB0aGUgZm9sbG93aW5nIHN0ZXAgOgo+ID4KPiA+IDEuIHBy
ZXBhcmUgdGhlIGVudmlyb25tZW50IHdpdGgKPiA+ICAgIC0gUWVtdS12aXJ0OiAgdjguMC4wICh3
aXRoIE9wZW5TYmkgdjEuMikKPiA+ICAgIC0gZWRrMiA6IGF0IGNvbW1pdCAoMmJjODU0NTg4MyAi
VWVmaUNwdVBrZy9DcHVQYWdlVGFibGVMaWI6IFJlZHVjZSB0aGUgbnVtYmVyIG9mIHJhbmRvbSB0
ZXN0cyIpCj4gPiAgICAtIExpbnV4IDogdjYuNC1yYzEgYW5kIGxhdGVyIHZlcnNpb24KPiA+Cj4g
PiAyLiBzdGFydCB0aGUgUWVtdSB2aXJ0IGJvYXJkCj4gPgo+ID4gYGBgc2gKPiA+ICQgY2F0IH4v
OF9yaXNjdi9zdGFydF9sYXRlc3Quc2gKPiA+ICMhL2Jpbi9iYXNoCj4gPiAvaG9tZS9zb25nLzhf
cmlzY3YvM19hY3BpL3FlbXUvb29vL3Vzci9sb2NhbC9iaW4vcWVtdS1zeXN0ZW0tcmlzY3Y2NCBc
Cj4gPiAgICAgICAgIC1zIC1ub2dyYXBoaWMgLWRyaXZlIGZpbGU9L2hvbWUvc29uZy84X3Jpc2N2
LzNfYWNwaS9CdWlsZF92aXJ0L1Jpc2NWVmlydFFlbXUvUkVMRUFTRV9HQ0M1L0ZWL1JJU0NWX1ZJ
UlQuZmQsaWY9cGZsYXNoLGZvcm1hdD1yYXcsdW5pdD0xIFwKPiA+ICAgICAgICAgLW1hY2hpbmUg
dmlydCxhY3BpPW9mZiAtc21wIDIgLW0gMkcgXAo+ID4gICAgICAgICAta2VybmVsIC9ob21lL3Nv
bmcvOV9saW51eC9saW51eC8wMF9ydl9kZWYvYXJjaC9yaXNjdi9ib290L0ltYWdlIFwKPiA+ICAg
ICAgICAgLWluaXRyZCAvaG9tZS9zb25nLzhfcmlzY3YvM19hY3BpL2J1aWxkcm9vdC9vdXRwdXQv
aW1hZ2VzL3Jvb3Rmcy5leHQyIFwKPiA+ICAgICAgICAgLWFwcGVuZCAicm9vdD0vZGV2L3JhbSBy
byBjb25zb2xlPXR0eVMwIGVhcmx5Y29uPXVhcnQ4MjUwLG1taW8sMHgxMDAwMDAwMCBlZmk9ZGVi
dWcgbG9nbGV2ZWw9OCBtZW1ibG9jaz1kZWJ1ZyIgIyMgYWxzbyBwYW5pYyBieSBtZW10ZXN0Cj4g
PiBgYGAKPiA+IDMuIFRoZW4geW91IHdpbGwgZW5jb3VudGVyIHRoZSBrZXJuZWwgcGFuaWMgbG9n
Z2VkIGluIHRoZSBhYm92ZSBsaW5rCj4gPgo+ID4gT3RoZXIgSW5mb3JtYXRpb246Cj4gPgo+ID4g
MS4gLS0tLS0tLQo+ID4KPiA+IFRoaXMgcmVwb3J0IGlzIG5vdCBpZGVudGljYWwgdG8gbXkgcHJp
b3IgcmVwb3J0IC0tICJrZXJuZWwgcGFuaWNlZCB3aGVuIHN5c3RlbSBoaWJlcm5hdGVzIiBbMV0s
IGJ1dCBib3RoIG9mIHRoZW0KPiA+IGFyZSBjbG9zZWx5IHJlbGF0ZWQgd2l0aCB0aGUgY29tbWl0
ICgzMzM1MDY4Zjg3MjEgInJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5l
YXIgbWFwcGluZyIpLgo+ID4KPiA+IFdpdGggdGhpcyBjb21taXQsIGhpYmVybmF0aW9uIGlzIHRy
YXBwZWQgd2l0aCAiYWNjZXNzIGZhdWx0IiB3aGlsZSBhY2Nlc3NpbmcgdGhlIFBNUC1wcm90ZWN0
ZWQgcmVnaW9ucyAobW1vZGVfcmVzdjBAODAwMDAwMDApCj4gPiBmcm9tIE9wZW5TYmkgKEJUVywg
aGliZXJuYXRpb24gaXMgbWFya2VkIGFzIG5vbnBvcnRhYmxlIGJ5IENvbm9yWzJdKS4KPiA+Cj4g
PiBJbiB0aGlzIHJlcG9ydCwgZWZpX2luaXQgaGFuZG9mZnMgdGhlIG1lbW9yeSBtYXBwaW5nIGZy
b20gQm9vdCBTZXJ2aWNlcyB0byBtZW1ibG9jayB3aGVyZSByZXNlcnZlcyBtbW9kZV9yZXN2MEA4
MDAwMDAwMCwKPiA+IHNvIHRoZXJlIGlzIG5vICJhY2Nlc3MgZmF1bHQiIGJ1dCAicGFnZSBmYXVs
dCIuCj4gPgo+ID4gQW5kIHJldmVydGluZyBjb21taXQgMzMzNTA2OGY4NzIxIGluZGVlZCBmaXhl
ZCB0aGlzIHBhbmljLgo+ID4KPiA+IDIuIC0tLS0tLS0KPiA+Cj4gPiBBcyB0aGUgZ2RiLXB0LWR1
bXAgWzNdIHRvb2wgc2hvd3MsIHRoZSBQVEUgd2hpY2ggY292ZXJlZCB0aGUgZmF1bHQgdmlydHVh
bCBhZGRyZXNzIGhhZCB0aGUgYXBwcm9wcmlhdGUgcGVybWlzc2lvbiB0byBzdG9yZS4KPiA+IElz
IHRoZXJlIGFub3RoZXIgd2F5IHRvIHRyaWdnZXIgdGhlICJTdG9yZS9BTU8gcGFnZSBmYXVsdCI/
IE9yIHRoZSBjcmVhdGlvbiBvZiBsaW5lYXIgbWFwcGluZyBpbiBjb21taXQgMzMzNTA2OGY4NzIx
IGRpZCBzb21ldGhpbmcgd3Jvbmc/Cj4gPgo+ID4gYGBgCj4gPiAoZ2RiKSBwL3ggJHNhdHAKPiA+
ICQxID0gMHhhMDAwMDAwMDAwMDgxNzA4Cj4gPiAoZ2RiKSBwdCAtc2F0cCAweGEwMDAwMDAwMDAw
ODE3MDgKPiA+ICAgICAgICAgICAgICBBZGRyZXNzIDogICAgIExlbmd0aCAgIFBlcm1pc3Npb25z
Cj4gPiAgIDB4ZmYxYmZmZmZmZWEzOTAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDowIFI6MSBTOjEK
PiA+ICAgMHhmZjFiZmZmZmZlYmY5MDAwIDogICAgIDB4MTAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+
ID4gICAweGZmMWJmZmZmZmVjMDAwMDAgOiAgIDB4NDAwMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4g
PiAgIDB4ZmY2MDAwMDAwMDAwMDAwMCA6ICAgMHgxYzAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+
ICAgMHhmZjYwMDAwMDAwMjAwMDAwIDogICAweGEwMDAwMCB8IFc6MCBYOjAgUjoxIFM6MQo+ID4g
ICAweGZmNjAwMDAwMDBjMDAwMDAgOiAweDdmMDAwMDAwIHwgVzoxIFg6MCBSOjEgUzoxICAvLyBi
YWRhZGRyOiBmZjYwMDAwMDdmZGIxMDAwCj4gPiAgIDB4ZmY2MDAwMDA3ZmRjMDAwMCA6ICAgIDB4
M2QwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+ICAgMHhmZjYwMDAwMDdmZmJmMDAwIDogICAgIDB4
MTAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+ID4gICAweGZmZmZmZmZmODAwMDAwMDAgOiAgIDB4YzAw
MDAwIHwgVzowIFg6MSBSOjEgUzoxCj4gPiAgIDB4ZmZmZmZmZmY4MGMwMDAwMCA6ICAgMHhhMDAw
MDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+Cj4gPiBgYGAKPiA+Cj4gPiAzLiAtLS0tLS0KPiA+Cj4g
PiBZb3UgY2FuIGFsc28gcmVwcm9kdWNlIHNpbWlsYXIgcGFuaWMgYnkgYXBwZW5kaW5nICJtZW10
ZXN0IiBpbiBrZXJuZWwgY21kbGluZS4KPiA+IEkgaGF2ZSBwb3N0ZWQgdGhlIG1lbXRlc3QgYm9v
dCBsb2cgYXQgdGhpcyBsaW5rOiBodHRwczovL3Rlcm1iaW4uY29tLzF0d2wuCj4gPgo+ID4gUGxl
YXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLgo+ID4KPiA+IFsxXTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvQ0FBWXMyPWdRdmtoVGVpb01tcVJEVkdqZHRORl92aEIrdm1f
MWRISnhQTmk3NVlEUV9RQG1haWwuZ21haWwuY29tLwo+ID4gWzJdOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDUyNi1hc3RyaWRlLWRldG9uYXRvci05YWUxMjAwNTEx
NTlAd2VuZHkvCj4gPiBbM106IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXJ0aW5yYWRldi9nZGItcHQt
ZHVtcAo+IAo+IFRoYW5rcyBmb3IgdGhlIHRob3JvdWdoIHJlcG9ydCwgcmVhbGx5IGFwcHJlY2lh
dGVkLgo+IAo+IFNvIHRoZXJlIGFyZSBtdWx0aXBsZSBpc3N1ZXMgaGVyZToKPiAKPiAtIHRoZSBm
aXJzdCBvbmUgaXMgdGhhdCB0aGUgbWVtb3J5IHJlZ2lvbiBmb3Igb3BlbnNiaSBpcyBtYXJrZWQg
YXMgbm90Cj4gY2FjaGVhYmxlIGluIHRoZSBlZmkgbWVtb3J5IG1hcCwgYW5kIHRoZW4gdGhpcyBy
ZWdpb24gaXMgbm90IG1hcHBlZCBpbgo+IHRoZSBsaW5lYXIgbWFwcGluZzoKPiBbICAgIDAuMDAw
MDAwXSBlZmk6ICAgMHgwMDAwODAwMDAwMDAtMHgwMDAwODAwM2ZmZmYgW1Jlc2VydmVkICAgIHwg
ICB8Cj4gIHwgIHwgIHwgIHwgIHwgIHwgIHwgIHwgICB8ICB8ICB8ICB8VUNdCj4gCj4gLSB0aGUg
c2Vjb25kIG9uZSAodGhhdCBJIGZlZWwgYSBiaXQgYXNoYW1lZCBvZi4uLikgaXMgdGhhdCBJIGRp
ZCBub3QKPiBjaGVjayB0aGUgYWxpZ25tZW50IG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgd2hlbiBj
aG9vc2luZyB0aGUgbWFwIHNpemUKPiBpbiBiZXN0X21hcF9zaXplKCkgYW5kIHRoZW4gd2UgZW5k
IHVwIHRyeWluZyB0byBtYXAgYSBwaHlzaWNhbCByZWdpb24KPiBhbGlnbmVkIG9uIDJNQiB0aGF0
IGlzIGFjdHVhbGx5IG5vdCBhbGlnbmVkIG9uIDJNQiB2aXJ0dWFsbHkgYmVjYXVzZQo+IHRoZSBv
cGVuc2JpIHJlZ2lvbiBpcyBub3QgbWFwcGVkIGF0IGFsbC4KPiAKPiAtIHRoZSBwb3NzaWJsZSB0
aGlyZCBvbmUgaXMgdGhhdCB3ZSBzaG91bGQgbm90IG1hcCB0aGUgbGluZWFyIG1hcHBpbmcKPiB1
c2luZyA0SyBwYWdlcywgdGhpcyB3b3VsZCBiZSBzbG93IGluIG15IG9waW5pb24sIGFuZCBJIHRo
aW5rIHdlCj4gc2hvdWxkIHdhc3RlIGEgYml0IG9mIG1lbW9yeSB0byBhbGlnbiB2YSBhbmQgcGEg
b24gYSAyTUIgYm91bmRhcnkuCj4gCj4gU28gSSdsbCBmaXggdGhlIHNlY29uZCBpc3N1ZSwgYW5k
IHBvc3NpYmx5IHRoZSB0aGlyZCBvbmUsIGFuZCBpZiBubwo+IG9uZSBsb29rcyBpbnRvIHdoeSB0
aGUgb3BlbnNiaSByZWdpb24gaXMgbWFwcGVkIGluIFVDLCBJJ2xsIHRha2UgYQo+IGxvb2sgYXQg
ZWRrMi4KPiAKSGkgQWxleCwKCkVESzIgbWFya3Mgb3BlbnNiaSByYW5nZSBhcyByZXNlcnZlZCBt
ZW1vcnkgaW4gRUZJIG1hcC4gQWNjb3JkaW5nIHRvIERUCnNwZWMsIGlmIHRoZSBuby1tYXAgaXMg
bm90IHNldCwgd2UgbmVlZCB0byBtYXJrIGl0IGFzCkVmaUJvb3RTZXJ2aWNlc0RhdGEgYnV0IEVm
aUJvb3RTZXJ2aWNlc0RhdGEgaXMgYWN0dWFsbHkgY29uc2lkZXJlZCBhcwpmcmVlIG1lbW9yeSBp
biBrZXJuZWwsIGFzIHBlciBVRUZJIHNwZWMuIFRvIGF2b2lkIGtlcm5lbCB1c2luZyB0aGlzCm1l
bW9yeSwgd2UgZGV2aWF0ZWQgZnJvbSB0aGUgRFQgc3BlYyBmb3Igb3BlbnNiaSByYW5nZXMuCgpM
ZXQgbWUga25vdyB5b3VyIHRob3VnaHRzIGhvdyB3ZSBjYW4gaGFuZGxlIHRoaXMgYmV0dGVyIGlu
IEVESzIKY29uc2lkZXJpbmcgaXQgaGFzIHRvIHN1cHBvcnQgQUNQSSBhbHNvLgoKVGhhbmtzLApT
dW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
