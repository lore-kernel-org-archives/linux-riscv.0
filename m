Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE4BCDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu/6J93OfQZDdSENAwT3t/JCpfzfdL0yNODJjRMgGIs=; b=47n36jLf7sgB1u
	Ryo90Yjd+7EWlFgXNFjaYIBeczGZvGGun4kPc/HWXCCso0YOyxe5HMGycR86DTeX6RoegNoqEJPUO
	cC7i67nCn/uco+52wacxI2M/pJ0gkDZ4XsABkdF7qrwYzjLjcpYhr0w/netBosSckFWNCvRGUY/kr
	9SwsOD/YSz1+tYMdnNgl4Ws/qNDt+eyq4cjwp9vrXbjMMAKMC36UPtKwJpb3dxYbTPUUrpwPpF6Tf
	oLTyn5ZipcytqGGWBR5LJ8xRZDTtCn/QSqqg38ebO9KfZFVYF5vqPKLWPaXMWkKn3/udE3KG509b4
	gzgWtykFmrDOLo9CbVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzR7-001WVd-1B;
	Thu, 12 Oct 2023 17:25:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzR3-001WUC-0s
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 17:25:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so997685f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697131513; x=1697736313; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GR45HvpPGYGyKJdDdOEfRl3cPRY2j7mziXItIyI7xCc=;
        b=dTuHEW/Jhv5BM/ugHrXVyEW6pf9LxeEzMvFzVQ28VrnXtt3czJMF46L932UlnkVeGu
         R0/ZjlsYJIogHHV1oGjYpP9YHsOGRwh0KhCsMRcwZ65Y5qniawzsP1bBLgwaVbWNd162
         hI7dbofg91Q5b28LreqwGTmNC9nsr6W+RzXxndP7g5PdKr3x8tIUiz1yDzcQFUst71xe
         u7GcSw67eeTgh5HEx6Ph3c4SkXd4NRYhQz+rBaPGisLR5Gm3YhkT8RkHBZ5ZuQWjz7BO
         7Hcqvt6d8BkWBJevleWNdQgGY5C7hib+5PpHhN5LrMeMemIXtic2xXoKj6+qhfaOA042
         B/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131513; x=1697736313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GR45HvpPGYGyKJdDdOEfRl3cPRY2j7mziXItIyI7xCc=;
        b=cM3c1ERcMH2bMP19TfC55FH3QWUeAhTKPY4ewC93v1LhCtDjx0lH0GVt+zfXFujqxc
         0rFcyS4I2+7ZUvOfHqep0OCk5e+eFbk+/zcwL1YSWRmvd/SAQKL4goHVi9RgVqGPqmtX
         MT/11Ln+VMxzAcGAMtXytbf6vJyoriGqT6xkawr8xIG9EOZTVwJM0Hgr+aFxH2FOP2d9
         NpnRy12XKuQGf676RoUnVn0pZJgxEwALFlN811DhaAnos0NwjA3fgnfkEi/hMJlMTnk0
         d1PKsMUmfBjoOsK7OWWykPgGkqtybi0MMOlMWZKRjfxxUJMUxGJh6D03jjlT/QHQH2sp
         QwTg==
X-Gm-Message-State: AOJu0YzNucWDGaP/Fit1hrvO2RjYCGQxqnAvHqRSmbdwILxoEWY4L7jv
	Bkm2kuDjtYtlmmxZ4lKTTklSig==
X-Google-Smtp-Source: AGHT+IHslQuEJ+cjbaCXxD+d+oJCrKWsOjqpokwS22OsNhqoxWfdG+dklUqIXGAHTzR54eEb11atRQ==
X-Received: by 2002:a05:6000:2a3:b0:32d:8189:c065 with SMTP id l3-20020a05600002a300b0032d8189c065mr7542688wry.58.1697131513011;
        Thu, 12 Oct 2023 10:25:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r25-20020adfa159000000b0032d819a8900sm6099150wrr.27.2023.10.12.10.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:25:12 -0700 (PDT)
Date: Thu, 12 Oct 2023 19:25:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com, conor.dooley@microchip.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231012-b5b2d068ef07fd574207cc15@orel>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
 <20231012-powdery-demeanor-4d8dde576f24@spud>
 <20231012-pulverize-founding-f459336028a2@spud>
 <20231012-0cb15beef3128da9f3bd3299@orel>
 <CAK9=C2VFi+jtNGo+dueXcG8iRW=r1z-c1P_8SRGAxaByW=8tuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VFi+jtNGo+dueXcG8iRW=r1z-c1P_8SRGAxaByW=8tuA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_102521_366685_B26647D6 
X-CRM114-Status: GOOD (  35.09  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMTA6MDk6NDRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCA5OjMx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBPY3QgMTIsIDIwMjMg
YXQgMDI6MzI6NDZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIE9j
dCAxMiwgMjAyMyBhdCAwMjozMDowMlBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+
ID4gWW8sCj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAwOToyMTo1MEFN
ICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiBXaGVuIHRoZSBTVVNQIFNCSSBl
eHRlbnNpb24gaXMgcHJlc2VudCBpdCBpbXBsaWVzIHRoYXQgdGhlIHN0YW5kYXJkCj4gPiA+ID4g
PiAic3VzcGVuZCB0byBSQU0iIHR5cGUgaXMgYXZhaWxhYmxlLiBXaXJlIGl0IHVwIHRvIHRoZSBn
ZW5lcmljCj4gPiA+ID4gPiBwbGF0Zm9ybSBzdXNwZW5kIHN1cHBvcnQsIGFsc28gYXBwbHlpbmcg
dGhlIGFscmVhZHkgcHJlc2VudCBzdXBwb3J0Cj4gPiA+ID4gPiBmb3Igbm9uLXJldGVudGl2ZSBD
UFUgc3VzcGVuZC4gV2hlbiB0aGUga2VybmVsIGlzIGJ1aWx0IHdpdGgKPiA+ID4gPiA+IENPTkZJ
R19TVVNQRU5ELCBvbmUgY2FuIGRvICdlY2hvIG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUnIHRvIHN1
c3BlbmQuCj4gPiA+ID4gPiBSZXN1bXB0aW9uIHdpbGwgb2NjdXIgd2hlbiBhIHBsYXRmb3JtLXNw
ZWNpZmljIHdha2UtdXAgZXZlbnQgYXJyaXZlcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+Cj4g
PiA+ID4gPiArc3RhdGljIGludCBfX2luaXQgc2JpX3N5c3RlbV9zdXNwZW5kX2luaXQodm9pZCkK
PiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiArIGlmICghc2JpX3NwZWNfaXNfMF8xKCkgJiYgc2JpX3By
b2JlX2V4dGVuc2lvbihTQklfRVhUX1NVU1ApID4gMCkgewo+ID4gPiA+Cj4gPiA+ID4gUmFuZG9t
IHRob3VnaHQgSSBoYWQgcmVhZGluZyB0aGlzLCB3YXMgdGhhdCBpdCdsbCBiZSBwb3NzaWJsZSB0
byBoYXZlIGEKPiA+ID4gPiBmaXJtd2FyZSB0aGF0IGltcGxlbWVudHMgU0JJIDwgMi4wIHRoYXQg
cHJvdmlkZXMgdGhlIFNVU1AgZXh0ZW5zaW9uLgo+ID4gPiA+IEZXSVcsIEkgZG9uJ3QgdGhpbmsg
dGhhdCB0aGF0IGlzIHByb2JsZW1hdGljLCBidXQgbWF5YmUgSSBhbSBtaXNzaW5nCj4gPiA+ID4g
c29tZXRoaW5nIHRoYXQgd291bGQgbWFrZSBpdCBzby4KPiA+ID4KPiA+ID4gSG1tLCBuZXh0IHBh
dGNoIEkgbG9vayBhdCBpcyBmcm9tIEFudXAncyBkZWJ1ZyBjb25zb2xlIHNlcmllcywgYW5kIGhl
Cj4gPiA+IGRvZXMgY2hlY2sgdGhhdCB0aGUgU0JJIGltcGxlbWVudGF0aW9uIGlzIGF0IGxlYXN0
IHZlcnNpb24gMi4wIGJlZm9yZQo+ID4gPiBwcm9iaW5nIGZvciB0aGUgZXh0ZW5zaW9uLiBXZSBz
aG91bGQgcHJvYmFibHkgaGF2ZSB0aGUgc2FtZSBwb2xpY3kKPiA+ID4gZXZlcnl3aGVyZS4KPiA+
Cj4gPiBZZWFoLCB0aGUgbWFpbiByZWFzb24gSSB3cm90ZSBpbiB0aGUgb3RoZXIgcmVzcG9uc2Ug
dGhhdCBJJ2QgcHJlZmVyIG5vdAo+ID4gdG8gYWx3YXlzIGNoZWNrIHZlcnNpb24gd2hlbiBwcm9i
aW5nIGlzIGJlY2F1c2UgaW4gbW9zdCAoSSB0aGluayBhbGwKPiA+IGV4Y2VwdCBQTVUpIGNhc2Vz
IGl0IHdvdWxkIG9ubHkgcmVkdWNlIHRoZSBwbGF0Zm9ybXMgd2hlcmUgdGhlIGV4dGVuc2lvbgo+
ID4gY2FuIGJlIHVzZWQsIGJ1dCB3aXRob3V0IGFueSByZWFzb24gdG8gZG8gc28uIEZvciBleGFt
cGxlLCByaWdodCBub3cgUUVNVQo+ID4gYnVuZGxlcyBhbiBPcGVuU0JJIHYxLjMuMSBiaW5hcnkg
YW5kIHRoYXQgdmVyc2lvbiBzdXBwb3J0cyBib3RoIFNVU1AgYW5kCj4gPiBEQkNOLCBidXQsIGlm
IHdlIHdlcmUgdG8gYWRkIFNCSSAyLjAgY2hlY2tzIGluIExpbnV4IGZvciB0aG9zZSBleHRlbnNp
b25zLAo+ID4gdGhlbiB1c2VycyB3aWxsIG5lZWQgdG8gdXBkYXRlIHRoZWlyIFNCSSBpbXBsZW1l
bnRhdGlvbnMgaW4gb3JkZXIgdG8gdXNlCj4gPiB0aGVtLiBXaGlsZSByZXF1aXJpbmcgdXNlcnMg
dG8gdXBkYXRlIHRoZWlyIFNCSSBpbXBsZW1lbnRhdGlvbnMgbWFrZXMKPiA+IHNlbnNlIGZvciBu
ZXcgZnVuY3Rpb25hbGl0eSBvciBmaXhlcywgaXQgc2VlbXMgbGlrZSBhIGxvdCB0byBhc2sgZm9y
IHRoZW0KPiA+IHRvIGp1c3QgZ2V0IGEgYmlnZ2VyIG51bWJlciBpbiB0aGVpciB2ZXJzaW9uIGNo
ZWNrLgo+ID4KPiA+IChBbmQgdGhlbiB0aGVyZSdzIGRvd25zdHJlYW0gU0JJIGltcGxlbWVudGF0
aW9ucyB3aGljaCBtYXkgZW5kIHVwIGNoZXJyeQo+ID4gcGlja2luZyBleHRlbnNpb25zLCBzbyB0
aGVpciB2ZXJzaW9uIG51bWJlcnMgd291bGQgYmUgaGFyZCB0byBkZWZpbmUuKQo+ID4KPiA+IFNv
IG15IHZvdGUgZm9yIExpbnV4IHBvbGljeSB3b3VsZCBiZSB0byBvbmx5IGRvIHZlcnNpb24gY2hl
Y2tzIHdoZW4KPiA+IG5lY2Vzc2FyeS4gQW5kIG15IHByZWZlcmVuY2UgZm9yIFNCSSB3b3VsZCBi
ZSB0byB0cnkgYW5kIGF2b2lkIHNwZWNpZnlpbmcKPiA+IGV4dGVuc2lvbnMgd2hpY2ggcmVxdWly
ZSBjbGllbnRzIHRvIGNoZWNrIHZlcnNpb25zLgo+IAo+IEluIGFkZGl0aW9uIHRvIFNCSSBQTVUs
IGV2ZW4gU0JJIFNUQSBhbmQgU0JJIE5BQ0wgcmVxdWlyZXMgc3BlYyB2ZXJzaW9uCj4gY2hlY2sg
YmVjYXVzZSB0aGVzZSBuZXcgU0JJIGV4dGVuc2lvbnMgdXNlIFNCSV9FUlJfTk9fU0hNRU0KPiBl
cnJvciBjb2RlIHdoaWNoIGlzIG5vdCBhdmFpbGFibGUgaW4gU0JJIHYxLjAgKG9yIGxvd2VyKS4K
CkJ1dCB3aGVuIHRob3NlIGV4dGVuc2lvbnMgYXJlIHByZXNlbnQsIHRoZXkgbXVzdCBpbXBsZW1l
bnQgdGhlaXIKc3BlY2lmaWNhdGlvbnMsIHdoaWNoIG1lYW5zIFNCSV9FUlJfTk9fU0hNRU0gbXVz
dCBhbHNvIGJlIHByZXNlbnQuCkZyb20gYSBjbGllbnQncyBwZXJzcGVjdGl2ZSBnZXR0aW5nIGFu
IGFmZmlybWF0aXZlIHRoYXQgdGhlIGV4dGVuc2lvbiBpcwpwcmVzZW50IGlzIGVub3VnaC4gQWxz
byBjaGVja2luZyB0aGUgU0JJIHZlcnNpb24gaXMgYmFzaWNhbGx5IHR1cm5pbmcgdGhlCmNsaWVu
dCBpbnRvIGFuIFNCSSBpbXBsZW1lbnRhdGlvbiBzYW5pdHkgY2hlY2tlci4KCj4gCj4gTXkgcmVj
b21tZW5kYXRpb24gaXMgdGhhdCBTQkkgaW1wbGVtZW50YXRpb24gc2hvdWxkIGNvbXBseSB3aXRo
IHRoZQo+IG1pbmltdW0gU0JJIHNwZWMgdmVyc2lvbiByZXF1aXJlZCBieSB0aGUgU0JJIGV4dGVu
c2lvbnMgd2hpY2ggaXQKPiBpbXBsZW1lbnRzLgo+CgpJIGFncmVlLCBidXQgU0JJIGltcGxlbWVu
dGF0aW9uIHZlcnNpb25zIGRvbid0IGdldCBidW1wZWQgdW50aWwgYWZ0ZXIKc3BlYyBmcmVlemVz
LCBldmVuIHRob3VnaCB0aGV5IGluY29ycG9yYXRlIGV2ZXJ5dGhpbmcgbmVlZGVkIGZvciB0aGUK
bmV3IGV4dGVuc2lvbnMgYW5kIHRoZSBleHRlbnNpb25zIHRoZW1zZWx2ZXMuCgpMaW51eCBjYW4g
Y2VydGFpbmx5IGNob29zZSB0byBiZSBzdHJpY3QgYWJvdXQgdGhlIFNCSSBpbXBsZW1lbnRhdGlv
bnMKZnJvbSB3aGljaCBpdCBlbmFibGVzIGV4dGVuc2lvbnMsIGJ1dCBJJ20gc3RpbGwgbm90IHN1
cmUgaXQncyBuZWNlc3NhcnkuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
