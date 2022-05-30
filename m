Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD6EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 23:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pWz/h7UWD7r9zJQZeRikw0k9u8um+nfGK7VcfNjNut8=; b=Nk0Dgry3RRT6K9tMXByoT1k3CP
	YOj29T5txOAfKh9EzKHcS03fSSFXmN13MI7Upr5f0SPkO+CXjm/KB4ueuV+MlCnHIXalTqAdKMWCu
	XlLGOQnzQcMQR2YA/VpkWqmqW7iaIpFMnn47Dwdyi3zU6//tsN5AGl21gQKrahEE+jCYm4sCIEoYr
	I27Kj39vJWj7gelp41/wifk0YVLga2VhOO2ixbcAuGiTLfvY245Wv53+R6VYMR/cFP0jGP3M1vy+d
	+EY8tMZowFxZLU8/Mm62gEgpprvUBX9kV9e4ABtKsih5OakIZcNes/wz/C4R2TkZAcg6/b00U1wcW
	ZyHVc4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvoXs-008ZsE-3w; Mon, 30 May 2022 23:11:32 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvoXp-008Zr3-A9
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 23:11:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id bo5so11650408pfb.4
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=XccysWYb9npF6/LhDMMloDpt6bBM9wjai1M7rMuSIWA=;
        b=rEab6xQwEY+eak1x8ft2kjj07SA4kneFvxf9adlurZbtSov84bRMpGloFeGQOBjiJE
         OQ2qrUSAwSfpyJM2Fcl4HvAPv3VSoYYPvdnUj2w6JucpE9uPQ0mnkx71/OhVqYg2+CWg
         BBQ/lbXI6x43ekWTRCgZ/Dm9K31i4HWACdKAO2U24CgCYtqI5zT0cLGqr9Ia8zvNX5Pp
         +rFWp27IhTGXJMo46x6MaK4PZXfQ2VWP1+42/N4/90uwBRCpvCKB4ArBfcdGDt08Vcxx
         q1AC3Q/Ldch9FHiiWGDvfctYxhGuvdatyIXFs2ah/NxknnESi/6v7I4Rby1xMSc8iLxh
         ULIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=XccysWYb9npF6/LhDMMloDpt6bBM9wjai1M7rMuSIWA=;
        b=GqKSMHagZk66w2MT7Z1O9ryOvtbJIXYMVXcR2YSwZjhoEb8v8I6gNm8A6l6wMu9VCO
         7xXdfXklBh90HDeN4pEZECJXgXbzQvirqGcdnd6m4TgboyDFI+WinOc6adwO0wVgJgvu
         IEKBzmnzdKCQcw5ciUXVIbA1sVCkMbgyzcZWjJG4SarDJogTU9l+P8GmwRLevz2AhGC4
         +peKFgxzxMnx3FkNCtamW3fhtL+DP+f3GX/pSkjpzu3xfK8m3gNjb5JE/sI9QwJTJ7mA
         hxPH7QEjp5/NvwIOqgF4yJinU/JjAD6KNp2cUC1OSUJTiZClDjwr5Pafor7uKLvS6HdA
         rtlg==
X-Gm-Message-State: AOAM532ARMHImtPwH5q0gHzaTBNWYDcODcUPax71aKvymNzJ00EVlS46
	lmRB+GHCHcs+R3VZeoD979ooqw==
X-Google-Smtp-Source: ABdhPJywJkfeRl2r1A5LD7jIeXFcAGYOXC/vSUBBTpRc2bJNyDatde0HYxiGJjkDLh3XNObv/FtM4g==
X-Received: by 2002:a05:6a00:248c:b0:519:27f7:28a8 with SMTP id c12-20020a056a00248c00b0051927f728a8mr20376570pfv.32.1653952288194;
        Mon, 30 May 2022 16:11:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z125-20020a626583000000b00518119900e9sm9372102pfb.53.2022.05.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 16:11:27 -0700 (PDT)
Date: Mon, 30 May 2022 16:11:27 -0700 (PDT)
X-Google-Original-Date: Mon, 30 May 2022 16:11:25 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add]
In-Reply-To: <20220530194133.udwdjsb2l33hsiil@pengutronix.de>
CC: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, sunnanyong@huawei.com,
  jszhang@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
  Stephen Rothwell <sfr@canb.auug.org.au>, alex@ghiti.fr, christophe.leroy@csgroup.eu, naveen.n.rao@linux.vnet.ibm.com,
  lizhengyu3@huawei.com, aou@eecs.berkeley.edu, liaochang1@huawei.com,
  Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Topel <bjorn.topel@gmail.com>, kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org, penberg@kernel.org, ebiederm@xmission.com, kernel@pengutronix.de,
  akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-99e09fbd-fa71-40fc-92da-ff4af0d209a5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_161129_457428_4D848564 
X-CRM114-Status: GOOD (  38.65  )
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

T24gTW9uLCAzMCBNYXkgMjAyMiAxMjo0MTozMyBQRFQgKC0wNzAwKSwgdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlIHdyb3RlOgo+IEhlbGxvLAo+Cj4gT24gTW9uLCBNYXkgMzAsIDIwMjIg
YXQgMTE6NTg6MTZBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+IE9uIE1vbiwgMzAg
TWF5IDIwMjIgMDA6NDI6MDIgUERUICgtMDcwMCksIHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZSB3cm90ZToKPj4gPiBXaXRob3V0IHRoaXMgY2hhbmdlIGFyY2gvcmlzY3Yva2VybmVsL2Vs
Zl9rZXhlYy5jIGZhaWxzIHRvIGNvbXBpbGUgb25jZQo+PiA+IGNvbW1pdCAyMzNjMWU2YzMxOWMg
KCJrZXhlY19maWxlOiBkcm9wIHdlYWsgYXR0cmlidXRlIGZyb20KPj4gPiBhcmNoX2tleGVjX2Fw
cGx5X3JlbG9jYXRpb25zW19hZGRdIikgaXMgYWxzbyBjb250YWluZWQgaW4gdGhlIHRyZWUuCj4+
ID4gVGhpcyBjdXJyZW50bHkgaGFwcGVucyBpbiBuZXh0LTIwMjIwNTI3Lgo+PiA+IAo+PiA+IFBy
ZXBhcmUgdGhlIFJJU0MtViBzaW1pbGFyIHRvIHRoZSBzMzkwIGFkYXB0aW9uIGRvbmUgaW4gMjMz
YzFlNmMzMTljLgo+PiA+IFRoaXMgaXMgc2FmZSB0byBkbyBvbiB0b3Agb2YgdGhlIHJpc2N2IGNo
YW5nZSBldmVuIHdpdGhvdXQgdGhlIGNoYW5nZSB0bwo+PiA+IGFyY2hfa2V4ZWNfYXBwbHlfcmVs
b2NhdGlvbnMuCj4+ID4gCj4+ID4gRml4ZXM6IDgzOGIzZTI4NDg4ZiAoIlJJU0MtVjogTG9hZCBw
dXJnYXRvcnkgaW4ga2V4ZWNfZmlsZSIpCj4+ID4gTG9va3MtZ29vZC10bzogbGlhb2NoYW5nIChB
KSA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+PiA+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4+ID4gLS0tCj4+ID4gCj4+
ID4gT24gTW9uLCBNYXkgMzAsIDIwMjIgYXQgMDk6NDM6MjZBTSArMDgwMCwgbGlhb2NoYW5nIChB
KSB3cm90ZToKPj4gPiA+ID4gSSBjYW4gY29uZmlybSB0aGF0IGRvaW5nCj4+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaAo+PiA+ID4gYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPj4gPiA+ID4gaW5kZXggMjA2MjE3YjIzMzAxLi5lZWUy
NjBlOGFiMzAgMTAwNjQ0Cj4+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2V4
ZWMuaAo+PiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPj4gPiA+
ID4gQEAgLTU1LDYgKzU1LDEzIEBAIGV4dGVybiByaXNjdl9rZXhlY19tZXRob2QgcmlzY3Zfa2V4
ZWNfbm9yZWxvY2F0ZTsKPj4gPiA+ID4gID4gICNpZmRlZiBDT05GSUdfS0VYRUNfRklMRQo+PiA+
ID4gPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZXhlY19maWxlX29wcyBlbGZfa2V4ZWNfb3BzOwo+
PiA+ID4gPiArCj4+ID4gPiA+ICtzdHJ1Y3QgcHVyZ2F0b3J5X2luZm87Cj4+ID4gPiA+ICtpbnQg
YXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQoc3RydWN0IHB1cmdhdG9yeV9pbmZvICpw
aSwKPj4gPiA+ID4gKwkJCQkgICAgIEVsZl9TaGRyICpzZWN0aW9uLAo+PiA+ID4gPiArCQkJCSAg
ICAgY29uc3QgRWxmX1NoZHIgKnJlbHNlYywKPj4gPiA+ID4gKwkJCQkgICAgIGNvbnN0IEVsZl9T
aGRyICpzeW10YWIpOwo+PiA+ID4gPiArI2RlZmluZSBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRp
b25zX2FkZCBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZAo+PiA+ID4gPiAgI2VuZGlm
Cj4+ID4gPiA+ICA+ICAjZW5kaWYKPj4gPiA+IAo+PiA+ID4gTEdUTSwgeW91IGNvdWxkIHNlbmQg
YSBmaXh1cCBwYXRjaCB0byByaXNjdiwgdGhhbmtzLgo+PiA+ID4gCj4+ID4gPiA+ID4gb24gdG9w
IG9mIDgzOGIzZTI4NDg4ZiByZXN1bHRzIGluIGEgY29tcGlsYWJsZSB0cmVlLiBBbmQgd2hlbgo+
PiA+ID4gbWVyZ2luZwo+PiA+ID4gPiAyMzNjMWU2YzMxOWMgaW50byB0aGlzLCBpdCBpcyBzdGls
bCBidWlsZGluZy4KPj4gPiA+ID4gPiBJJ20gbm90IGVub3VnaCBpbnRvIGtleGVjIChhbmQgcmlz
Y3YpIHRvIGp1ZGdlIGlmIHRoaXMgaXMKPj4gPiA+IHNlbnNpYmxlLCBvcgo+PiA+ID4gPiBjcmVh
dGUgYSB1c2VmdWwgY29tbWl0IGxvZyBidXQgdGhlIG9idmlvdXMgd2F5IGZvcndhcmQgaXMgdG8g
YXBwbHkgdGhlCj4+ID4gPiA+IGFib3ZlIHBhdGNoIHRvIHRoZSByaXNjdiB0cmVlIGJlZm9yZSBp
dCBoaXRzIExpbnVzJyB0cmVlLgo+PiA+IAo+PiA+IE9rLCBoZXJlIGNvbWVzIGEgcGF0Y2ggd2l0
aCBhIGdlbmVyaWMgY29tbWl0IGxvZy4KPj4gPiAKPj4gPiBAcmlzY3YgcGVvcGxlOiBJZiB5b3Ug
cHJlZmVyLCBzcXVhc2ggaXQgaW50byA4MzhiM2UyODQ4OGYuCj4+IAo+PiBTb3JyeSwganVzdCBz
YXcgdGhpcyBhZnRlciBJIHNlbnQgbXkgdmVyc2lvbiBvZiB0aGUgZml4LiAgVGhleSdyZSB0aGUg
c2FtZSwKPj4gYnV0IGRvIHlvdSBtaW5kIHNlbmRpbmcgYSBmdWxsLW9uIHBhdGNoIHNvIEkgY2Fu
IG1lcmdlIGl0Pwo+Cj4gU29ycnksIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIHJlcXVlc3QuIEkg
Zm91bmQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIyMDUzMDE4MDQw
OC4xNjIzOS0xLXBhbG1lckByaXZvc2luYy5jb20vCj4KPiBidXQgSSBkb24ndCBrbm93IHdoYXQg
YSBmdWxsLW9uIHBhdGNoIGlzIGFuZCB3aGF0IHN0b3BzIHlvdSBtZXJnaW5nIG15Cj4gcGF0Y2gu
IAo+Cj4gSXMgaXQgdGhhdCBpdCdzIGluIHJlcGx5IHRvIGEgcGF0Y2ggc2VyaWVzIGFuZCBiNCBm
YWlscyB0byBmZXRjaCB0aGUKPiByaWdodCBwYXRjaCBhbmQgeW91IGFzayB0byBzZW5kIGl0IGlu
IGEgbmV3IHRocmVhZD8KCllhLCB3aXRoIHRoZSByZXBseSBiaXRzIGluIHRoZXJlIG15IG1haWwg
bWVyZ2UgKHdoaWNoIHVuZm9ydHVuYXRlbHkgCmlzbid0IGI0LCBJIGhhdmVuJ3QgZ290dGVuIGFy
b3VuZCB0byBjb252ZXJ0aW5nIHlldCkgZ290IHRyaXBwZWQgdXAuICAKSXQncyBraW5kIG9mIGVh
c3kgdG8gZm9yIG1lIHRvIHNjcmV3IHNvbWV0aGluZyB1cCB0cnlpbmcgdG8gcHVsbCBiaXRzIApv
dXQgb2YgcmVwbGllcyBhbmQgc3VjaCwgYnV0IEkgdGhpbmsgdGhpcyBvbmUgd2FzIHByZXR0eSBz
aW1wbGUgKGxvb2tzIApsaWtlIG1heWJlIHNvbWUgUEdQIG9yIE1JTUUgdGhpbmcgd2FzIHRoZSBp
c3N1ZSkuCgpJIGp1c3QgcHV0IAo8aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcGFsbWVyL2xpbnV4LmdpdC9jb21taXQvP2g9Zm9yLW5leHQmaWQ9NzY5OWY3
YWFjZjNlYmZlZTUxYzY3MGI2Zjc5NmIyNzk3ZjBmNzQ4Nz4gCm9uIG15IHN0YWdpbmcgYnJhbmNo
LCBpdCBsb29rcyBPSyB0byBtZSBidXQgTE1LIGlmIHRoZXJlJ3MgYSBwcm9ibGVtLgoKVGhhbmtz
IQoKPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+Cj4gLS0gCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAgICAgICB8Cj4g
SW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cu
cGVuZ3V0cm9uaXguZGUvIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
