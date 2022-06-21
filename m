Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA269C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjwHWLOer6EPZuun66PYRnoTulccDs2NpgI+r21mfts=; b=XMfvfTlCVmLITr
	wuUpIURmipscCTHEzi4wwlXg9pvNxwQyGDwNWPEtJwHm7X+91dbQym2A6nZtg+lKXWl7iSqYcVevw
	x3akxF9B1Dc6I9u3mV5Fc6YBJDUE8KR5OUq1VQ9MK1pXHwu5VCYPjcJ9lYWh/cB0jqJIZXRdhwbqS
	tXFUyTyEPDrU9L+Cm+/r6fTkKYcpvk+nUwJPXjp/euMka9gCxVPfX5qkZntHlUKDVPWx51wgP4BXP
	olRvVpRurenw05HaWbSVcXJOBasyNw/AhS6CFuLHsUklekf8yKgF2uUFU16lrSevW9M8K0N8nLR9J
	Ofak0yBaCQM6Kz+wBHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Yfs-004D4I-Li; Tue, 21 Jun 2022 07:51:48 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Yfo-004D1E-Sm
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 07:51:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id s21so10422280lfs.13
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C43G7OP5T13FTpq18dv8vek6Xm2VVX3iEQqYB+pBnxQ=;
        b=caTdju9eo2lIZz5cmdYtRpSaBf3lqPh+AZOlRsDlj2vIrqJLKOuk0aUohUKl/6l0HC
         C7ONtVUasQadYAxv+N9ef90NLTdgw4IBlAdq4ZhwprBiXzSkI/1oJZQF2XzaV9PbClRG
         Y2M2DShadLkoS+dQkHB2xLkNi+22EaX15TGWJ+xWrekHFfWvnl86018YL0xhewS3UQSc
         zA3m1b/p9hdmShlkvg5/BvK47KYJzLHRhigSLaCuq2Z+kWrRPGaazgkS6Vk1zoLbM2ua
         sy3nyYolFFGwYCKTI/6gd7aOpso1+C7xNZhXYQ+uD66vh9LioLZCV0Mq6edsWfuFZqzl
         wihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C43G7OP5T13FTpq18dv8vek6Xm2VVX3iEQqYB+pBnxQ=;
        b=pDfBAYIfVTEGOfC6Zulv0IM16MrqOpr1xCewqtTVHXDniMK0mqpGYo4iNPmTV1u+Lo
         SpYjvsA0VjVkNgwpyWRlTifziEdek0UExl4NL0Df7+kN+9NSJhSHlwQWdJsGTKezcJMB
         k2k11XvQVYBTBNkc+fiaBl9A6U+n2MMPFIR2NpTH9ep33R4lnD0mOjmqWzVCurLK4RTG
         ulaU6PeUX5f2SlNi3zy7kUrlDF2iBLyckoO1TgIQdm9lEB9F6CxBh3G6+AQJ6+OqKTF3
         PPNvT0Tycz1wTI2mQeT1ck8AYJd/oJRfbbnpYAC4o9IaSPHC/kZu2jW5OsKDoQqt2Yc6
         nIQQ==
X-Gm-Message-State: AJIora94v8dq1rFUoIiC+GVx8FPfhNRYXq8+66lgIL4op9gaGwcoL2gp
	vhQyKJdasmflRxRwoY2o3+ihOTizflVQZd06aKYtQA==
X-Google-Smtp-Source: AGRyM1txURs3R58y/o69nTNlDWo9qFx554cdLekLz8IA3BceaY4qBwfW1KSZOthWW8ybIACOruUQRGTQvga+tuY580E=
X-Received: by 2002:ac2:484d:0:b0:47f:7ebf:336 with SMTP id
 13-20020ac2484d000000b0047f7ebf0336mr1232541lfy.130.1655797900889; Tue, 21
 Jun 2022 00:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220619111115.6354-1-nikita.shubin@maquefel.me>
 <20220619111115.6354-2-nikita.shubin@maquefel.me> <CAK9=C2X4TTCEjZya4wz-W6ndBaxzUpLBtzQAGJ4zphVM8NSgdg@mail.gmail.com>
 <20220620174006.1c86a456@redslave.neermore.group> <CAOnJCU+7_z1WN_Z6frQcUwzztVL4itbPSfmLUa_7Ob5xCtLo+Q@mail.gmail.com>
 <20220621104139.7c77e348@redslave.neermore.group>
In-Reply-To: <20220621104139.7c77e348@redslave.neermore.group>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 21 Jun 2022 13:21:11 +0530
Message-ID: <CAK9=C2UiPdB2+UU6aqh5Muf0cnu87k01f1iga6mUYKZgiceAKQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
	Sunil V L <sunilvl@ventanamicro.com>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	linux <linux@yadro.com>, Nikita Shubin <n.shubin@yadro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_005145_015852_CB641E37 
X-CRM114-Status: GOOD (  38.84  )
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

T24gVHVlLCBKdW4gMjEsIDIwMjIgYXQgMToxMyBQTSBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1
YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPgo+IEhlbGxvIEFudXAhCj4KPiBPbiBNb24sIDIwIEp1
biAyMDIyIDEyOjQwOjIwIC0wNzAwCj4gQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9y
Zz4gd3JvdGU6Cj4KPiA+IE9uIE1vbiwgSnVuIDIwLCAyMDIyIGF0IDc6NDAgQU0gTmlraXRhIFNo
dWJpbgo+ID4gPG5pa2l0YS5zaHViaW5AbWFxdWVmZWwubWU+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBNb24sIDIwIEp1biAyMDIyIDE3OjMwOjU4ICswNTMwCj4gPiA+IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiBPbiBTdW4sIEp1biAxOSwg
MjAyMiBhdCA0OjQxIFBNIE5pa2l0YSBTaHViaW4KPiA+ID4gPiA8bmlraXRhLnNodWJpbkBtYXF1
ZWZlbC5tZT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRnJvbTogTmlraXRhIFNodWJpbiA8
bi5zaHViaW5AeWFkcm8uY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFByb3ZpZGUgUklTQy1WIFNC
SSBQTVUgaWQgdG8gZGlzdGluZ3Vpc2ggZGlmZmVyZW50IGNvcmVzIG9yCj4gPiA+ID4gPiBTb0Nz
IHZpYSAiZGV2aWNlcy9wbGF0Zm9ybS9yaXNjdi1wbXUvaWQiIHN5c2ZzIGVudHJ5Lgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFRoZSBpZGVudGlmaWNhdGlvbiBpcyBnZW5lcmF0ZWQgYXMgc3RyaW5nIG9m
IG1hcmNoaWQsIG1pbXBpZCwKPiA+ID4gPiA+IG12ZW5kb3JpZCBpbiBoZXggZm9ybWF0IHNlcGFy
YXRlZCBieSBjb21hIC0KPiA+ID4gPiA+ICIweDcwMDMyLDB4NzAwMzIsMHgwIi4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBUaGUgQ1NScyBhcmUgZGV0YWlsZWQgaW4gdGhlIFJJU0MtViBwcml2aWxlZ2Vk
IHNwZWMgWzFdLgo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1p
c2EtbWFudWFsCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW5zcGlyZWQtYnk6IEpvw6NvIE3DoXJpbyBE
b21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+Cj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Cj4gPiA+ID4KPiA+ID4g
PiBUaGUgbXZlbmRvcmlkLCBtYXJjaGlkLCBhbmQgbWltcGlkIGNhbiBiZSB1c2VmdWwgdG8gYXBw
cyBvdGhlcgo+ID4gPiA+IHRoYW4gcGVyZiB0b29sLgo+ID4gPiA+Cj4gPiA+ID4gSSBoYXZlIHRy
aWVkIHRvIGV4dGVuZCAvcHJvYy9jcHVpbmZvIHdpdGggdGhpcyBpbmZvcm1hdGlvbiB3aGljaAo+
ID4gPiA+IGNhbiBiZSBwYXJzZWQgYnkgcGVyZiB0b29sOgo+ID4gPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIyMDYyMDExNTU0OS4xNTI5NTk3LTEtYXBhdGVsQHZlbnRhbmFtaWNy
by5jb20vCj4gPiA+ID4KPiA+ID4KPiA+ID4gQXRpc2gsIHdoYXQgZG8geW91IHRoaW5rIGFib3V0
IHRoaXMgPwo+ID4gPgo+ID4gPiBSSVNDLVYgcGVyZiBjYW4gcmVseSBvbiAiL3Byb2MvY3B1aW5m
byIsIGluIHNvbWUgc2ltaWxhciBtYW5uZXIgbGlrZQo+ID4gPiAidG9vbHMvcGVyZi9hcmNoL3Mz
OTAvdXRpbC9oZWFkZXIuYyIgZG9lcy4KPiA+ID4KPiA+Cj4gPiBZZXMuIFdlIGNhbiBleHBvc2Ug
dGhlc2UgdGhyZWUgdmFsdWVzIGVpdGhlciBpbiBzeXNmcyBvciBwcm9jZnMKPiA+ICgvcHJvYy9j
cHVpbmZvKS4gRm9yIHBlcmYgdG9vbCwgaXQgc2hvdWxkbid0IG1hdHRlciBhcyB0aGUgaGVhZGVy
LmMKPiA+IHdpbGwgbmVlZCB0byBnZW5lcmF0ZSB0aGUgdW5pcXVlIGNwdWlkCj4gPiBzdHJpbmcg
ZnJvbSBlaXRoZXIuCj4gPgo+ID4gSSBhbSBub3Qgc3VyZSBpZiBhbnkgb3RoZXIgdXNlcnNwYWNl
IHRvb2wgcHJlZmVycyB0byBwYXJzZSBzeXNmcwo+ID4gaW5zdGVhZCBvZiBjcHVpbmZvLgo+Cj4g
T2theSAtIGxldCdzIHN0aWNrIHRvIC9wcm9jL2NwdWluZm8uCgpTb3VuZHMgZ29vZC4KCllvdSBt
aWdodCBoYXZlIHRvIHdyaXRlIC9wcm9jL2NwdWluZm8gcGFyc2luZyBjb2RlIGluIHBlcmYgdG9v
bApoZWFkZXIuYy4gRG8geW91IHBsYW4gdG8gc2VuZCB2NCBvZiBwZXJmIHRvb2wgcGF0Y2hlcyA/
PwoKUmVnYXJkcywKQW51cAoKPgo+ID4KPiA+ID4gQ2FuIGl0IGNyZWF0ZSBwcm9ibGVtcyB3aXRo
IHBtdSBpZGVudGlmaWNhdGlvbiBpbiBjYXNlIG9mCj4gPiA+IGhldGVyZ2Vub3VzIGhhcnRzID8K
PiA+ID4KPiA+Cj4gPiBEb2VzIHBlcmYgc3VwcG9ydCBoZXRlcmdlbm91cyBoYXJ0cyBhdCBhbGwg
PyBBUk02NCBjb2RlCj4gPiAodG9vbC9wZXJmL2FyY2gvYXJtNjQvdXRpbC9oZWFkZXIuYykKPiA+
IGp1c3QgYnJlYWtzIG91dCBvZiB0aGUgbG9vcCBhZnRlciBmaW5kaW5nIHRoZSBmaXJzdCBNSURS
Lgo+ID4KPiA+ID4gPgo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gQW51cAo+ID4gPiA+Cj4gPiA+
ID4gPiAtLS0KPiA+ID4gPiA+IHYzLT52NDoKPiA+ID4gPiA+IC0gdXNlIHN0cmluZyBmb3IgcG11
aWQKPiA+ID4gPiA+IC0gcmVuYW1lIHBtdV9zYmlfaWRfc2hvdyB0byBpZF9zaG93Cj4gPiA+ID4g
PiAtIGZpeCBlcnJvciBwcmludCBtZXNzYWdlIGluIGlkX3Nob3cKPiA+ID4gPiA+IC0gZml4IERF
VklDRV9BVFRSIHRvIHVzZSBvY3RhbCBwZXJtaXNzaW9ucwo+ID4gPiA+ID4gLS0tCj4gPiA+ID4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAgIHwgIDMgKysrCj4gPiA+ID4gPiAgZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgIHwgNDEKPiA+ID4gPiA+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+IGluY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9w
bXUuaCB8IDEgKyAzIGZpbGVzIGNoYW5nZWQsIDQ1Cj4gPiA+ID4gPiBpbnNlcnRpb25zKCspCj4g
PiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiA+ID4gPiA+IGluZGV4IDc3NWQzMzIyYjQyMi4uNTBk
ZDliNmVjYzllIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
PiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gPiA+ID4gPiBAQCAtNjI3
LDE2ICs2MjcsMTkgQEAgbG9uZyBzYmlfZ2V0X212ZW5kb3JpZCh2b2lkKQo+ID4gPiA+ID4gIHsK
PiA+ID4gPiA+ICAgICAgICAgcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNFX0dF
VF9NVkVORE9SSUQpOwo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ICtFWFBPUlRfU1lNQk9MKHNiaV9n
ZXRfbXZlbmRvcmlkKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgbG9uZyBzYmlfZ2V0X21hcmNoaWQo
dm9pZCkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiAgICAgICAgIHJldHVybiBfX3NiaV9iYXNlX2Vj
YWxsKFNCSV9FWFRfQkFTRV9HRVRfTUFSQ0hJRCk7Cj4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gK0VY
UE9SVF9TWU1CT0woc2JpX2dldF9tYXJjaGlkKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgbG9uZyBz
YmlfZ2V0X21pbXBpZCh2b2lkKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAgICAgICAgcmV0dXJu
IF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNFX0dFVF9NSU1QSUQpOwo+ID4gPiA+ID4gIH0K
PiA+ID4gPiA+ICtFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbWltcGlkKTsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiAgc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19pcGkoY29uc3Qgc3RydWN0IGNwdW1h
c2sgKnRhcmdldCkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gPiA+ID4gYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3Ni
aS5jIGluZGV4IGRjYTM1MzdhOGRjYy4uYmU4MTJmODU1NjE3Cj4gPiA+ID4gPiAxMDA2NDQgLS0t
IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gPiA+ID4gQEAgLTY5Myw2ICs2OTMsMjggQEAgc3RhdGlj
IGludCBwbXVfc2JpX3NldHVwX2lycXMoc3RydWN0Cj4gPiA+ID4gPiByaXNjdl9wbXUgKnBtdSwg
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRlIHJldHVybiAwOwo+ID4gPiA+ID4gIH0KPiA+ID4g
PiA+Cj4gPiA+ID4gPiArc3RhdGljIHNzaXplX3QgaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vf
YXR0cmlidXRlICphdHRyLAo+ID4gPiA+ID4gY2hhciAqYnVmKSArewo+ID4gPiA+ID4gKyAgICAg
ICBpbnQgbGVuOwo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPQo+ID4g
PiA+ID4gY29udGFpbmVyX29mKGRldl9nZXRfZHJ2ZGF0YShkZXYpLCBzdHJ1Y3QgcmlzY3ZfcG11
LCBwbXUpOyArCj4gPiA+ID4gPiArICAgICAgIGxlbiA9IHNwcmludGYoYnVmLCAiJXNcbiIsIHBt
dS0+cG11aWQpOwo+ID4gPiA+ID4gKyAgICAgICBpZiAobGVuIDw9IDApCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgZGV2X2VycihkZXYsICJpbnZhbGlkIHNwcmludGYgbGVuOiAlZFxuIiwgbGVu
KTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIGxlbjsKPiA+ID4gPiA+ICt9
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArc3RhdGljIERFVklDRV9BVFRSKGlkLCAwNjQ0LCBpZF9z
aG93LCBOVUxMKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0
ZSAqcG11X3NiaV9hdHRyc1tdID0gewo+ID4gPiA+ID4gKyAgICAgICAmZGV2X2F0dHJfaWQuYXR0
ciwKPiA+ID4gPiA+ICsgICAgICAgTlVMTAo+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArQVRUUklCVVRFX0dST1VQUyhwbXVfc2JpKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICBz
dGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUg
PSBOVUxMOwo+ID4gPiA+ID4gQEAgLTcxNCw2ICs3MzYsMTQgQEAgc3RhdGljIGludCBwbXVfc2Jp
X2RldmljZV9wcm9iZShzdHJ1Y3QKPiA+ID4gPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikgaWYg
KHBtdV9zYmlfZ2V0X2N0cmluZm8obnVtX2NvdW50ZXJzKSkKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICBnb3RvIG91dF9mcmVlOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgLyogZmlsbCBw
bXVpZCAqLwo+ID4gPiA+ID4gKyAgICAgICBwbXUtPnBtdWlkID0ga2FzcHJpbnRmKEdGUF9LRVJO
RUwsICIweCVseCwweCVseCwweCVseCIsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2JpX2dldF9tYXJjaGlkKCksCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2JpX2dldF9taW1waWQoKSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzYmlfZ2V0X212ZW5kb3JpZCgpKTsKPiA+ID4gPiA+ICsgICAgICAgaWYg
KCFwbXUtPnBtdWlkKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWVfcG11
aWQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgICAgICAgIHJldCA9IHBtdV9zYmlfc2V0dXBfaXJx
cyhwbXUsIHBkZXYpOwo+ID4gPiA+ID4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIHByX2luZm8oIlBlcmYgc2FtcGxpbmcvZmlsdGVyaW5nIGlzIG5vdAo+
ID4gPiA+ID4gc3VwcG9ydGVkIGFzIHNzY29mIGV4dGVuc2lvbiBpcyBub3QgYXZhaWxhYmxlXG4i
KTsgQEAgLTczOSw4Cj4gPiA+ID4gPiArNzY5LDE5IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZp
Y2VfcHJvYmUoc3RydWN0Cj4gPiA+ID4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHJldHVybiBy
ZXQ7IH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiArICAgICAgIHJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91
cCgmcGRldi0+ZGV2LmtvYmosCj4gPiA+ID4gPiAmcG11X3NiaV9ncm91cCk7Cj4gPiA+ID4gPiAr
ICAgICAgIGlmIChyZXQpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2
LT5kZXYsICJzeXNmcyBjcmVhdGlvbiBmYWlsZWRcbiIpOwo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgICAgcGRldi0+ZGV2Lmdyb3VwcyA9IHBtdV9zYmlfZ3JvdXBzOwo+ID4gPiA+ID4gKyAg
ICAgICBkZXZfc2V0X2RydmRhdGEoJnBkZXYtPmRldiwgcG11KTsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gK291dF9mcmVlX3BtdWlk
Ogo+ID4gPiA+ID4gKyAgICAgICBrZnJlZShwbXUtPnBtdWlkKTsKPiA+ID4gPiA+ICBvdXRfZnJl
ZToKPiA+ID4gPiA+ICAgICAgICAga2ZyZWUocG11KTsKPiA+ID4gPiA+ICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BlcmYvcmlzY3ZfcG11
LmgKPiA+ID4gPiA+IGIvaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oIGluZGV4Cj4gPiA+
ID4gPiA0NmY5YjZmZTMwNmUuLmNmMzU1N2I3N2ZiOCAxMDA2NDQgLS0tCj4gPiA+ID4gPiBhL2lu
Y2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaCArKysKPiA+ID4gPiA+IGIvaW5jbHVkZS9saW51
eC9wZXJmL3Jpc2N2X3BtdS5oIEBAIC00Miw2ICs0Miw3IEBAIHN0cnVjdAo+ID4gPiA+ID4gY3B1
X2h3X2V2ZW50cyB7IHN0cnVjdCByaXNjdl9wbXUgewo+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3Qg
cG11ICAgICAgcG11Owo+ID4gPiA+ID4gICAgICAgICBjaGFyICAgICAgICAgICAgKm5hbWU7Cj4g
PiA+ID4gPiArICAgICAgIGNoYXIgICAgICAgICAgICAqcG11aWQ7Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gICAgICAgICBpcnFyZXR1cm5fdCAgICAgKCpoYW5kbGVfaXJxKShpbnQgaXJxX251bSwgdm9p
ZCAqZGV2KTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi4zNS4xCj4gPiA+ID4g
Pgo+ID4gPgo+ID4KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
