Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB320ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkh5A2myEVF5JXVYbAfT7u2LAQsyCrRqbOWeYM7mgco=; b=NwIjGdOEgobOs8
	PYCTDfDbYRQiAN9fL3mbZeNkSbpcEDNPzoNmTFp9j4uccqE4NGqwfH6yBHKtVbsCU2391pNtnh5ND
	G0FBohN3Kridru/FwUmOdaSDZ8+E1hYO/pe1zFnMJbVrMHX7HJy/2Wq3FSPnRFLbpfeKjub3FD0LL
	iwjJEXsFe29EDIDiC5z8MeKhrvvWby4gFxs+v3BzcxjzIpCuxEVunuXwxXSCbtDLJm/BeFjgRNLI8
	o+wMshmVgdjuexHJLflF7OAfX1wUZppHHFcp+KSxG92ng2ua0pkupA/P/hnkT3SfFcbPy1NMBaPZn
	5d2bD1VEmBsntdybInYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWjIR-001Ymw-Ep; Fri, 09 Sep 2022 19:04:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWjIO-001Ykl-C6
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 19:04:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bq9so4403375wrb.4
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=pKUha8KPeXhipsOQ5xtfWdepBcWzrEN7wq95Ka7WsLo=;
        b=Cz31QytU1QsjnJJn8X8BLIOOskEjB11J65qBwAk1qWhP4jZKat84rlSLWDg+u26uQf
         3QcSlXC5tofl7XtpLytxNY+SPWv4eMDMC7CUDTvBuqQ270re+jlbOdSmdpK7l/9eWbuj
         1LwCGsA7kG6q6aY2sYVoRLwrHDa8fmapoGVJkeNJMtDPKo17p808Hb5tAm03QCCs1Pl4
         vwDb+A67HZFdRW+cMVyr/eA2iinX1CzT54D35Tl0q6PFnYhSgshWsyH2HklP7kkzTR82
         +UzpcHWXKsUQsDQ5rrWhb6OIleF1Oa+9Qx684a6aUPOP9gbkJnFqQRKAes6kf6gedSw5
         fWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pKUha8KPeXhipsOQ5xtfWdepBcWzrEN7wq95Ka7WsLo=;
        b=nV0vgQyKXZ9ed0j8zzK7EmqzFL8K9bynAU2jFl+ga2sIZteBH8Noc3f23CfwoiOaQx
         3rYz7x7XuLtAjem8Heb4w4uOKWNG9+chuCQID9q++lqzx7pK+Z+fW7mJpiPNtKwlYNfW
         vtI5RgVglOXwUAm1tRdXygsZWgubfyHdysgescif4cajul3cdyMFwVlpNd8C5zA4OIW3
         zkZeEckFqWejqB6zJa9ITRn1bTD3tHe8bQyuDV5RLxrwktNhglw2pggklfSLMjgcnoV/
         boAedztoq6DhKs3bIdpTEjN/uOM2B4upiCB5+6g/4FVpSF++L9fAMdMqP7tTFFBLINrL
         ZJPA==
X-Gm-Message-State: ACgBeo2Rwh+XiDL5SdGCmmvUEoDLKs+ecTV5d3cdNElThbxv/vEzejg8
	gQa4ZeYdGMH6lws7BiskGENplA==
X-Google-Smtp-Source: AA6agR4l4brO8ikaIINZSOF+InPTKxeLv1Ydx1twqMU5rtBcqinD3ZOU61suidSBYZGeFV2c2TaYSg==
X-Received: by 2002:adf:ea4a:0:b0:228:635a:d491 with SMTP id j10-20020adfea4a000000b00228635ad491mr9083471wrn.137.1662750243964;
        Fri, 09 Sep 2022 12:04:03 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b00228de351fc0sm1144987wrj.38.2022.09.09.12.04.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Sep 2022 12:04:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <3687587.6M6d0yLqnL@diego>
Date: Fri, 9 Sep 2022 20:04:02 +0100
Cc: Samuel Holland <samuel@sholland.org>,
 Conor.Dooley@microchip.com,
 devicetree <devicetree@vger.kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jernej.skrabec@gmail.com,
 Chen-Yu Tsai <wens@csie.org>,
 robh+dt@kernel.org,
 palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Message-Id: <F27C6531-E91E-4311-B64D-D26FE12086CA@jrtc27.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@sholland.org>
 <52217b50-c22f-5a21-e509-05d178e4a173@microchip.com>
 <3687587.6M6d0yLqnL@diego>
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_120408_523216_4AAF4716 
X-CRM114-Status: GOOD (  40.86  )
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

T24gOSBTZXB0IDIwMjIsIGF0IDA5OjExLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRl
PiB3cm90ZToKPiAKPiBBbSBGcmVpdGFnLCA5LiBTZXB0ZW1iZXIgMjAyMiwgMDk6MTg6NDAgQ0VT
VCBzY2hyaWViIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tOgo+PiBPbiAwOS8wOS8yMDIyIDA1
OjM3LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91Cj4+PiBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUKPj4+IAo+Pj4gSGkgQ29ub3IsCj4+PiAKPj4+IE9uIDgvMTkvMjIgNToxMCBQ
TSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+Pj4gRmluYWxseSBnb3QgYXJv
dW5kIHRvIGdpdmluZyB0aGlzIGEgZ28gd2l0aCB0aGUgZml4IGZvciBsb2FkaW5nIAo+Pj4+IG1v
ZHVsZXMgd2hpY2ggaXMgbW9zdGx5IHdoYXQgd2FzIGJsb2NraW5nIG1lIGJlZm9yZS4uCj4+Pj4g
Cj4+Pj4gT24gMTUvMDgvMjAyMiAwNjowOCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+Pj4+ICJE
MSBOZXpoYSIgaXMgQWxsd2lubmVyJ3MgZmlyc3QtcGFydHkgZGV2ZWxvcG1lbnQgYm9hcmQgZm9y
IHRoZQo+Pj4+PiBEMSBTb0MuIEl0IHdhcyBzaGlwcGVkIHdpdGggNTEyTSwgMUcsIG9yIDJHIG9m
IEREUjMuIEl0IHN1cHBvcnRzCj4+Pj4+IG9uYm9hcmQgYXVkaW8sCj4+Pj4gCj4+Pj4gSSBhbSBy
ZWFsbHkgbm90IGtlZW4gb24gdGhlIHdheSB5b3UgaGF2ZSB0aGluZ3MsIHdpdGggdGhlIG1lbW9y
eSAKPj4+PiBub2RlcyByZW1vdmVkIGZyb20gdGhlIGRldmljZSB0cmVlLiBJIGtub3cgeW91ciBw
cmVmZXJyZWQgZmxvdyBmb3IKPj4+PiBib290aW5nIHRoZXNlIHRoaW5ncyBtaWdodCBiZSB0byBw
YXNzIHRoZSBkdGIgdXAgZnJvbSBVLUJvb3QsIGJ1dCBJCj4+Pj4gdGhpbmsgdGhlIGRldmljZXRy
ZWUgaW4gdGhlIGtlcm5lbCBzaG91bGQgYmUgdXNhYmxlIGluIGEgc3RhbmRhbG9uZQo+Pj4+IG1h
bm5lciwgZXZlbiBpZiB0aGF0IGlzIHRoZSBiYXJlc3QtbWluaW11bSBtZW1vcnkgY29uZmlnLgo+
Pj4gCj4+PiBUaGF0IGlzIHNpbXBseSBub3QgcG9zc2libGUgdG8gZ3VhcmFudGVlLiBBcyBhbiBv
YnZpb3VzIGV4YW1wbGUsCj4+PiBjb25zaWRlciB0aGUgTWFuZ29QaSBNUS1Qcm8gYm9hcmQgd2l0
aCBzb2NrZXRlZCBEUkFNOgo+PiAKPj4gWWVhaCwgSSBrbmV3IGluIG15IGhlYXJ0LW9mLWhlYXJ0
cyB0aGF0IHRoaXMgcHJvYmFibHkgd2FzIGEgbm9uCj4+IHJ1bm5lci4KPj4gCj4+PiAKPj4+IGh0
dHBzOi8vdHdpdHRlci5jb20vbWFuZ29waV9zYmMvc3RhdHVzLzE1MTYyMjU1NTkyMTQ1ODM4MDgK
Pj4+IAo+Pj4gQnV0IGZvY3VzaW5nIG9uIHRoZSAvbWVtb3J5IG5vZGUgbWlzc2VzIHRoZSBiaWdn
ZXIgcGljdHVyZS4gVGhlIERUQgo+Pj4gaXMgcGFzc2VkIHRocm91Z2ggX2FsbF8gb2YgdGhlIGZp
cm13YXJlIHN0YWdlcywgYW5kIGdldHMgcGF0Y2hlZCBieQo+Pj4gZXZlcnkgb25lIG9mIHRoZW06
Cj4+PiAKPj4+IC0gU1BML2Jvb3QwIGFkZHMgdGhlIC9tZW1vcnkgbm9kZSB3aXRoIHRoZSBkZXRl
Y3RlZCBEUkFNIHNpemUuIElmIHRoZQo+Pj4gaW4tdHJlZSBEVFMgaGFzIGEgIm1pbmltdW0gbWVt
b3J5IGNvbmZpZyIgKHdoaWNoIGZvciBhIGJvYXJkIHdpdGgKPj4+IHNvY2tldGVkIERSQU0gbWVh
bnMgdGhlIHNtYWxsZXN0IHBvc3NpYmxlIGRpZSksIEkgZ3VhcmFudGVlIHBlb3BsZQo+Pj4gd2ls
bCB1c2UgaXQgYW5kIGNvbXBsYWluIGFib3V0IG1pc3NpbmcgRFJBTS4KPj4gCj4+IFRydWUsIGJ1
dCB0aGV5IGFyZSBhbHNvIGNvbXBsYWluaW5nIGFib3V0IG1pc3NpbmcgRFJBTSBhcyBpcyA7KQo+
PiBObyBwb3NzaWJpbGl0eSBvZiB3aW5uaW5nIGhlcmUgdW5mb3J0dW5hdGVseS4KPj4gCj4+PiAt
IFRoZSBTQkkgaW1wbGVtZW50YXRpb24gcmVzZXJ2ZXMgbWVtb3J5IGZvciBpdHNlbGYgYW5kIGFu
eSBwb3NzaWJsZQo+Pj4gc2VjdXJlIHBhcnRpdGlvbnMuIFJpZ2h0IG5vdywgYm9vdGluZyBoYXBw
ZW5zIHRvIHdvcmsgd2l0aG91dCB0aGUKPj4+IHJlc2VydmVkLW1lbW9yeSBub2RlIGJlY2F1c2Ug
dGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBpcyBsb2FkZWQgYXQgdGhlCj4+PiBiZWdpbm5pbmcgb2Yg
UkFNLCBhbmQgTGludXggaWdub3JlcyBSQU0gYmVsb3cgdGhlIGtlcm5lbCBsb2FkCj4+PiBhZGRy
ZXNzLgo+PiAKPj4gU3VyZWx5IHRoaXMgc29ydCBvZiB0aGluZyBpcyBhIGNvbW1vbiBwcm9ibGVt
IHRob3VnaCwgaXQncyBub3QgbGlrZQo+PiBhbnkgb2YgdXMgYXJlIGRvaW5nIHNvbWV0aGluZyB1
bmlxdWUgaGVyZSBhcmUgd2U/IEF0IGxlYXN0IGlmIHRoZXJlCj4+IHdhcyBhIGFyY2ggd2lkZSBw
b2xpY3kgYWJvdXQgdGhlIHZhbGlkaXR5IG9mIHRoZSB1cHN0cmVhbSBEVFMgaW4gdGhlCj4+IGZh
Y2Ugb2YgdGhlIFNCSSBldGMgaW5mbGljdGluZyBjaGFuZ2VzIHRoZXJlJ2QgYmUgc29tZXRoaW5n
IHRvIHBvaW50Cj4+IHRvLiBJIGFtIGp1c3QgbG9va2luZyBhdCB0aGlzIGZyb20gYSAiZXZlcnlv
bmUgZWxzZSBoYXMgYSB1c2FibGUgZHRzCj4+IGluIHRoZSBrZXJuZWwsIGJ1dCB0aGUgRDEgYm9h
cmRzIHdvbnQgaGF2ZSIgcG9pbnQgb2Ygdmlldy4KPiAKPiBOb3Qgc3VyZSBpZiB0aGlzIHdvdWxk
IGZseSwgYnV0IHdoYXQgYWJvdXQgaGF2aW5nIGFuIHNiaSBjYWxsIGZvcgo+ICJtb2RpZnkgdGhp
cyBkdGIgZm9yIG1lIGFzIHdlbGwiPwo+IAo+IEknbGwganVzdCBhc3N1bWUgdGhhdCBzcGwvYm9v
dDAgKyBtYWluIHVib290IGNvbWUgaW4gc29tZSBzb3J0Cj4gb2YgcGFja2FnZSBzbyBtb3Zpbmcg
dGhlIG1lbW9yeSBub2RlIG92ZXIgc2hvdWxkIGJlIGluIHVib290J3MKPiBzY29wZSwgYnV0IGZv
ciB0aGUgc2JpIHBhcnQganVzdCBoYXZlIGEgY2FsbCBwb2ludGluZyB0byB0aGUKPiBuZXcgZHRi
IGluIG1lbW9yeSBhbmQgaGF2ZSBpdCBtb2RpZnkgaXQgaW4gdGhlIHNhbWUgd2F5IGFzIHRoZQo+
IG9yaWdpbmFsIG9uZT8KClRoZXJl4oCZcyBhbiBFRkkgcHJvdG9jb2wgZm9yIGl0LgoKSmVzcwoK
PiBIZWlrbwo+IAo+IAo+IAo+Pj4gSG93ZXZlciwgbWVtb3J5LWNvbnN0cmFpbmVkIGRldmljZXMg
KGUuZy4gRDFzKSB3aWxsIG5lZWQgdG8gZ2V0IHRob3NlCj4+PiAyIE1pQiBiYWNrIGJ5IGxvYWRp
bmcgdGhlIGtlcm5lbCBhdCB0aGUgc3RhcnQgb2YgRFJBTSBhbmQgU0JJIGF0IHRoZQo+Pj4gZW5k
IG9mIERSQU0uIFRoZW4gdGhlIHJlc2VydmVkLW1lbW9yeSBub2RlIGJlY29tZXMgcXVpdGUgaW1w
b3J0YW50Lgo+Pj4gCj4+PiBJdCBhbHNvIGFkZHMgbm9kZXMgZm9yIENQVSBpZGxlIHN0YXRlcywg
c2luY2UgdGhlIGF2YWlsYWJsZSBzdGF0ZXMKPj4+IGFuZCB0aGVpciBsYXRlbmNpZXMgZGVwZW5k
IG9uIHRoZSBTQkkgaW1wbGVtZW50YXRpb24uCj4+PiAKPj4+IEl0IGFsc28gcmVzZXJ2ZXMgZGV2
aWNlcyB1c2VkIGJ5IGl0IG9yIGJ5IGEgc2VjdXJlIHBhcnRpdGlvbi4gQW5kIGl0Cj4+PiBpcyBy
ZXNwb25zaWJsZSBmb3IgZXh0cmFjdGluZyBkYXRhIChlLmcuIE1BQyBhZGRyZXNzZXMpIGZyb20g
InNlY3VyZSIKPj4+IGVGdXNlcyB3aGljaCB0aGUgT1MgbWF5IG5vdCBoYXZlIGFjY2VzcyB0by4K
Pj4+IAo+Pj4gLSBVLUJvb3QgYWRkcyBvdGhlciBpbmZvcm1hdGlvbiwgbGlrZSBib290IGFyZ3Vt
ZW50cywgdGhlIGFkZHJlc3Mgb2YKPj4+IHRoZSBpbml0cmFtZnMgYW5kIGZyYW1lYnVmZmVyLCBl
dGMuIFRoZXNlIGFyZSBsZXNzIG9mIGEgY29uY2Vybgo+Pj4gYmVjYXVzZSBvZiBjb3Vyc2UgVS1C
b290IGNhbiBwYXRjaCB0aGVzZSBpbiB0byBhIERUQiBsb2FkZWQgZnJvbQo+Pj4gZGlzaywgYnV0
IHRoZXkgYXJlIHJlbGV2YW50IGlmIHlvdSB3YW50IHRvIGxvYWQgYSBEVEIgZnJvbSBhIGxhdGVy
Cj4+PiBib290bG9hZGVyIGxpa2UgR1JVQi4KPj4+IAo+Pj4gSWYgeW91IGxvYWQgYSBEVEIgZnJv
bSBkaXNrLCB5b3UgbG9zZSBhbGwgb2YgdGhlIGNoYW5nZXMgbWFkZSBieSB0aGUKPj4+IGVhcmxp
ZXIgZmlybXdhcmUgc3RhZ2VzLiBPbiBBUk0sIFUtQm9vdCB0cmllcyB0byB3b3JrIGFyb3VuZCB0
aGlzIGJ5Cj4+PiBjb3B5aW5nIGEgZmV3IHNwZWNpZmljIGJpdHMgb2YgaW5mb3JtYXRpb24gZnJv
bSB0aGUgZmlybXdhcmUgRFRCIHRvCj4+PiB0aGUgRFRCIGxvYWRlZCBmcm9tIGRpc2suIEJ1dCB0
aGlzIG1pc3NlcyB0aGUgcG9pbnQgdGhhdCB0aGUgU0JJCj4+PiBpbXBsZW1lbnRhdGlvbiBjYW4g
bW9kaWZ5ICphbnkqIHBhcnQgb2YgdGhlIERUQi4gKFNvIGluIHByYWN0aWNlCj4+PiBVLUJvb3Qg
b24gQVJNIGFscmVhZHkgbG9zZXMgQ1BVIGlkbGUgc3RhdGVzIGFuZCByZXNlcnZlZCBtZW1vcnkg
bm9kZXMKPj4+IHRoYXQgd2VyZSBhZGRlZCBieSB0aGUgUFNDSSBpbXBsZW1lbnRhdGlvbi4pCj4+
IAo+PiBBbGwgb2YgdGhlc2UgdGhpbmdzIGFyZSB2YWxpZCwgYnV0IHRoZXkgYXJlIHJlYXNvbnMg
d2h5IHlvdXIgZmxvdyBpbgo+PiB5b3VyIGJvb3Rsb2FkZXJzIGV0YyBhcmUgdGhlIHdheSB0aGV5
IGFyZSBtb3JlIHRoYW4gYSByZWFzb24gd2h5IHRoZQo+PiB1cHN0cmVhbSBkdHMgd2lsbCBub3Qg
d29yayBmb3Igc29tZW9uZSB3aG8gaXMgbm90IGludGVyZXN0ZWQgaW4gdGhhdAo+PiBmbG93LiBB
dCB0aGUgZW5kIG9mIHRoZSBkYXksIEkgb25seSBjYXJlIHNvIG11Y2ggYWJvdXQgdGhpcyBhcyBp
dCBpcwo+PiBub3QgbWUgdGhhdCBoYXMgdG8gZGVhbCB3aXRoIGFueSBjb25mdXNpb24gZnJvbSBl
aXRoZXIgYXBwcm9hY2guIEknbGwKPj4gY29udGludWUgdG8gbW9kaWZ5IG15IGR0cyBpbiBVLUJv
b3Qgc28gSSBjYW4gdGVzdCB0aGluZ3Mgd2l0aG91dCBtZQo+PiBoYXZpbmcgdG8gcmUtcHJvZ3Jh
bSB0aGUgd29ybGQuIC9zaHJ1Zwo+PiAKPj4+IEFzIGFuIGV4dHJlbWUgZXhhbXBsZSwgY29uc2lk
ZXIgcGFyYXZpcnR1YWxpemF0aW9uLCB3aGVyZSBvbmx5IGEKPj4+IHNtYWxsIHN1YnNldCBvZiBE
UkFNIGFuZCBwZXJpcGhlcmFscyBtYXkgYmUgbWFkZSBhdmFpbGFibGUgdG8gYW55IG9uZQo+Pj4g
T1MgcGFydGl0aW9uLgo+PiAKPj4gT3IgQU1QIC0gdGhvdWdoIG5vdCBsaWtlbHkgdGhhdCB0aGF0
IGlzIGEgcHJvYmxlbSBmb3IgdGhlIEQxLi4KPj4gCj4+PiBGdW5kYW1lbnRhbGx5LCBJIHJlc2Vy
dmUgdGhlIHJpZ2h0IHRvIG1ha2UgYXJiaXRyYXJ5IGNoYW5nZXMgdG8gdGhlCj4+PiBEVEIgaW4g
dGhlIFNCSSBpbXBsZW1lbnRhdGlvbiwgYW5kIHRodXMgSSBjYW5ub3QgY29uZG9uZSB1c2luZyB0
aGUKPj4+IERUQnMgZ2VuZXJhdGVkIGZyb20gdGhlIExpbnV4IHNvdXJjZSB0cmVlIGZvciBhbnkg
cHVycG9zZSBvdGhlciB0aGFuCj4+PiB2YWxpZGF0aW9uLgo+PiAKPj4gRnVuZGFtZW50YWxseSwg
SSByZXNlcnZlIHRoZSByaWdodCB0byBjb21wbGFpbiB0aGF0IHRoZSB1cHN0cmVhbSBkdHMKPj4g
Y2Fubm90IGJlIGVudGlyZWx5IHZhbGlkYXRlZCBhcyBpdCBkb2VzIG5vdCB3b3JrIG91dC1vZi10
aGUtYm94IDspCj4+IAo+PiBFaXRoZXIgd2F5LCBJIGFtIG9ubHkgZ29pbmcgdG8gY29tcGxhaW4g
c28gbXVjaCBhYm91dCBzb21ldGhpbmcgdGhhdAo+PiB0cmlnZ2VycyBteSBPQ0QgYWJvdXQga2Vl
cGluZyB0aGluZ3MgdGhlIHNhbWUsIHlvdSBoYXZlIGEKPj4gVGVzdGVkLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+PiBhbHJlYWR5IGFuZCBvbmNlIHRoZSBv
dGhlciBpc3N1ZXMgYXJlIGNsZWFuZWQgdXAgYW4gUi1iIHRvby4gTm90IHRyeWluZwo+PiBtYWtl
IGFuIGlzc3VlIG91dCBvZiB0aGlzLCBqdXN0IGV4cHJlc3NpbmcgbXkgZGlzbGlrZSBmb3IgdGhl
Cj4+IGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgRDEgc3R1ZmYgYW5kIHZlbmRvcnMgLSBwYXJ0
bHkgaW4gdGhlIGhvcGVzCj4+IHRoYXQgdGhlICJoaWdoZXIgcG93ZXJzIiBnZXQgaW52b2x2ZWQu
IEkgY2FuJ3QgaW1hZ2luZSB0aGF0IHRoaXMgaXMKPj4gdGhlIGxhc3QgdGltZSBzb21ldGhpbmcg
bGlrZSB0aGlzIGNvbWVzIHVwLgo+PiAKPj4gVGhhbmtzLAo+PiBDb25vci4KPj4gCj4+IAo+PiAK
Pj4gCj4+IAo+PiAKPiAKPiAKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
