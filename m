Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAE0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCylscRVM9K4mlKiLfN6biefq8c0swMsqcE94UNLUD4=; b=rjCCpQgFe5LOnT
	X2kCelXFrvvgj0UOiFxHtY6mfLun6P17G8A3m5qbxSSnpMLJP7/TIcKWmYgCiTawkjS3Ie+O5RY8o
	GGgHGEb2iwtGILi5sYS8+n+qW9uDpnpUpKDhwJdIJJm/WgyHXDVvz5uluWx5962/ehQ+H3aqGVSxL
	+K8+Xaz9azLJDmMGkjlNGJb1FdkSTWDsT6Dp8p+2kXBFTfmLuP0TZubb1BkTkALTL4uwAQxl6XD+x
	SUzNGeObEhTgNiNk/DaXu8BJ3QfjNlk9sGQFfGDYGlsSDyh5qKVHoH18E7Vk5t/Eq7Tx35VVsnzch
	k+fmVGe+U+pJOL19CZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofsnK-00BofN-7R; Wed, 05 Oct 2022 01:01:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofsnF-00BoeM-A1
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 01:01:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id u10so23604034wrq.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=wDp06TM/LfYtmxO53ngC9ktZUc/T/i9wjEKdOBbz450=;
        b=WfswlzUogpVWnCBUYVelCVXLFoWKoy9Niv7ofDQRmVXgJBmRgV4rGa55EmsbTkaJTO
         4foN6tk10FEStH1gf/UCU6xajgJ9YwEOTiGLxjf00c/ZLY+lu/Tf9GitTZCubTa92dAV
         JVfnyqWMTA/V/ahKAQSkwC51md190VKtd10+Ha43VXJeFGw25NYPql2yUnp1e0wAMPFM
         hghL7SxEfvCYr+SDONGSOQWqDMB0IpfvM8P9LzuAHQIOIuOZNQRBo1gwHETSw8JqCA8w
         OwY/Pjs7kPrrFO+SzRB42kTNX+YIKu8R7xSBso3HBogywQNogyYMHSizURgJSCZ0zanu
         Pbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wDp06TM/LfYtmxO53ngC9ktZUc/T/i9wjEKdOBbz450=;
        b=Ydgqx2nEqbnGSR538GzR6ady9aNl03BfUPw5XNV4BgO7GxatErnLjpay4PkxXYbuwW
         98FufY33DZSB82s/0XzYhSJ08QZA8q1TjdVIeZ94DjIDkMJshlUSuvmnsse8YKRe3Bod
         rsO0sD6ujBn3n7G1wJkQmJHgE3Wfaw7STGcxCtfSyOCQItVhwvAqlmdYd2vzWaF+81si
         1JVmY6iVBo/+fgssXAyvRyyEvcSYEaKVacPdjniKdDvAKsH0QWY2UyeGo3hb9bsOpOQ2
         EaBBic0Gnln/+PqrCa6gTTCLsvsP7MrcDHsU9ZGy7E4GLcb7yqfoSlteoHLyhR2pvE/k
         s1rw==
X-Gm-Message-State: ACrzQf3KqReMdsL2PbrQqabDtnolO6/AigjJUDuIBDtvcd8uxVa8odDD
	fWQtgFnIqdbfvqPYIRdd5EAA8Q==
X-Google-Smtp-Source: AMsMyM5JULThZALhPCyEnL3qy58KXeNVmDkF/jV0QwqsfKrSKPmcs46hMaXrMvegCfgeDzGDiTkv7Q==
X-Received: by 2002:adf:fb05:0:b0:228:6463:b15d with SMTP id c5-20020adffb05000000b002286463b15dmr18002740wrr.534.1664931704235;
        Tue, 04 Oct 2022 18:01:44 -0700 (PDT)
Received: from smtpclient.apple (global-5-142.n-2.net.cam.ac.uk. [131.111.5.142])
        by smtp.gmail.com with ESMTPSA id e14-20020adfdbce000000b0022b014fb0b7sm13735924wrj.110.2022.10.04.18.01.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Oct 2022 18:01:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAJF2gTSwm9UkbvKpWuPTPyNQhApJivwwfJ_A9YA6WoC4HNsxbg@mail.gmail.com>
Date: Wed, 5 Oct 2022 02:01:42 +0100
Cc: Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Samuel Holland <samuel@sholland.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>,
 Dao Lu <daolu@rivosinc.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
Message-Id: <1CECF1C3-6FA1-49CC-8A7A-1E18E401B88B@jrtc27.com>
References: <20220922060958.44203-1-samuel@sholland.org>
 <2546376.ElGaqSPkdT@phil> <2E96A836-764D-4D07-AB79-3861B9CC2B1F@jrtc27.com>
 <13396584.uLZWGnKmhe@phil>
 <CAOnJCUKdBpbj=KDz5oibB_N_SjOiMrkWcttczuGbisi_nMWaVA@mail.gmail.com>
 <Yy+Plxzj4bckXrhy@spud>
 <CAOnJCU+fA-pxLPRviqW2d7q-E__qJYkZKkCdiNHXhJBjWCRPaA@mail.gmail.com>
 <YzS5kT2CCBPxqLg+@spud>
 <CAOnJCUKn-rNwyw5BK7=hNM-vnJ=VROjipCiDtB4BL=LZ3kKAAg@mail.gmail.com>
 <YzifTW5Y7O191gCo@spud>
 <CAOnJCUKtoiXKaS81BZyvpybFDkh-undHLqE5ZxoNmf9AtAtvfw@mail.gmail.com>
 <E5A6B840-A306-48E8-A60F-1D852B0639D6@jrtc27.com>
 <CAJF2gTSwm9UkbvKpWuPTPyNQhApJivwwfJ_A9YA6WoC4HNsxbg@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_180149_419466_4BE1C1BF 
X-CRM114-Status: GOOD (  37.84  )
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

T24gNSBPY3QgMjAyMiwgYXQgMDE6MzgsIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90
ZToKPiAKPiBPbiBXZWQsIE9jdCA1LCAyMDIyIGF0IDE6MjQgQU0gSmVzc2ljYSBDbGFya2UgPGpy
dGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPj4gCj4+IE9uIDQgT2N0IDIwMjIsIGF0IDE3OjUyLCBB
dGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPiB3cm90ZToKPj4+IAo+Pj4gT24gU2F0
LCBPY3QgMSwgMjAyMiBhdCAxOjEzIFBNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Pj4gCj4+Pj4gT24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMDg6MjY6MDFQTSAtMDcw
MCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgU2VwIDI4LCAyMDIyIGF0IDI6MTYg
UE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+IAo+Pj4+Pj4g
T24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMTI6MjE6NTVBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4+Pj4+Pj4gT24gU2F0LCBTZXAgMjQsIDIwMjIgYXQgNDoxNSBQTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gT24gRnJpLCBTZXAg
MjMsIDIwMjIgYXQgMTE6MDE6MjhBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4+Pj4+
PiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAxMjoxOCBBTSBIZWlrbyBTdHVlYm5lciA8aGVpa29A
c250ZWNoLmRlPiB3cm90ZToKPj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+PiBIaSwKPj4+Pj4+Pj4+PiAK
Pj4+Pj4+Pj4+PiBBbSBEb25uZXJzdGFnLCAyMi4gU2VwdGVtYmVyIDIwMjIsIDE3OjUyOjQ2IENF
U1Qgc2NocmllYiBKZXNzaWNhIENsYXJrZToKPj4+Pj4+Pj4+Pj4gT24gMjIgU2VwdCAyMDIyLCBh
dCAxNjo0NSwgSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4+Pj4+Pj4+
Pj4+PiAKPj4+Pj4+Pj4+Pj4+IEFtIERvbm5lcnN0YWcsIDIyLiBTZXB0ZW1iZXIgMjAyMiwgMDg6
MDk6NTggQ0VTVCBzY2hyaWViIFNhbXVlbCBIb2xsYW5kOgo+Pj4+Pj4+Pj4+Pj4+IGNvbW1pdCA4
ZWIwNjBlMTAxODUgKCJhcmNoL3Jpc2N2OiBhZGQgWmloaW50cGF1c2Ugc3VwcG9ydCIpIGJyb2tl
Cj4+Pj4+Pj4+Pj4+Pj4gYnVpbGRpbmcgd2l0aCBDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkUg
ZW5hYmxlZCAoZ2NjIDExLjEuMCk6Cj4+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+Pj4gQ0MgYXJj
aC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5Lm8KPj4+Pj4+Pj4+Pj4+PiBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46Cj4+Pj4+Pj4+Pj4+Pj4gLi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaDogSW4gZnVuY3Rpb24gJ2NwdV9yZWxheCc6Cj4+Pj4+
Pj4+Pj4+Pj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoyODU6MzM6IHdhcm5p
bmc6ICdhc20nIG9wZXJhbmQgMCBwcm9iYWJseSBkb2VzIG5vdCBtYXRjaCBjb25zdHJhaW50cwo+
Pj4+Pj4+Pj4+Pj4+IDI4NSB8ICNkZWZpbmUgYXNtX3ZvbGF0aWxlX2dvdG8oeC4uLikgYXNtIGdv
dG8oeCkKPj4+Pj4+Pj4+Pj4+PiB8IF5+fgo+Pj4+Pj4+Pj4+Pj4+IC4vYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9qdW1wX2xhYmVsLmg6NDE6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdh
c21fdm9sYXRpbGVfZ290bycKPj4+Pj4+Pj4+Pj4+PiA0MSB8IGFzbV92b2xhdGlsZV9nb3RvKAo+
Pj4+Pj4+Pj4+Pj4+IHwgXn5+fn5+fn5+fn5+fn5+fn4KPj4+Pj4+Pj4+Pj4+PiAuLy4vaW5jbHVk
ZS9saW51eC9jb21waWxlcl90eXBlcy5oOjI4NTozMzogZXJyb3I6IGltcG9zc2libGUgY29uc3Ry
YWludCBpbiAnYXNtJwo+Pj4+Pj4+Pj4+Pj4+IDI4NSB8ICNkZWZpbmUgYXNtX3ZvbGF0aWxlX2dv
dG8oeC4uLikgYXNtIGdvdG8oeCkKPj4+Pj4+Pj4+Pj4+PiB8IF5+fgo+Pj4+Pj4+Pj4+Pj4+IC4v
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9qdW1wX2xhYmVsLmg6NDE6OTogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvICdhc21fdm9sYXRpbGVfZ290bycKPj4+Pj4+Pj4+Pj4+PiA0MSB8IGFzbV92
b2xhdGlsZV9nb3RvKAo+Pj4+Pj4+Pj4+Pj4+IHwgXn5+fn5+fn5+fn5+fn5+fn4KPj4+Pj4+Pj4+
Pj4+PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ5OiBhcmNoL3Jpc2N2
L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXkub10gRXJyb3IgMQo+Pj4+Pj4+Pj4+Pj4+IG1ha2U6
ICoqKiBbYXJjaC9yaXNjdi9NYWtlZmlsZToxMjg6IHZkc29fcHJlcGFyZV0gRXJyb3IgMgo+Pj4+
Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+IEhhdmluZyBhIHN0YXRpYyBicmFuY2ggaW4gY3B1X3Jl
bGF4KCkgaXMgcHJvYmxlbWF0aWMgYmVjYXVzZSB0aGF0Cj4+Pj4+Pj4+Pj4+Pj4gZnVuY3Rpb24g
aXMgd2lkZWx5IGlubGluZWQsIGluY2x1ZGluZyBpbiBzb21lIHF1aXRlIGNvbXBsZXggZnVuY3Rp
b25zCj4+Pj4+Pj4+Pj4+Pj4gbGlrZSBpbiB0aGUgVkRTTy4gQSBxdWljayBtZWFzdXJlbWVudCBz
aG93cyB0aGlzIHN0YXRpYyBicmFuY2ggaXMKPj4+Pj4+Pj4+Pj4+PiByZXNwb25zaWJsZSBieSBp
dHNlbGYgZm9yIGFyb3VuZCA0MCUgb2YgdGhlIGp1bXAgdGFibGUuCj4+Pj4+Pj4+Pj4+Pj4gCj4+
Pj4+Pj4+Pj4+Pj4gRHJvcCB0aGUgc3RhdGljIGJyYW5jaCwgd2hpY2ggZW5kcyB1cCBiZWluZyB0
aGUgc2FtZSBudW1iZXIgb2YKPj4+Pj4+Pj4+Pj4+PiBpbnN0cnVjdGlvbnMgYW55d2F5LiBJZiBa
aWhpbnRwYXVzZSBpcyBzdXBwb3J0ZWQsIHdlIHRyYWRlIHRoZSBub3AgZnJvbQo+Pj4+Pj4+Pj4+
Pj4+IHRoZSBzdGF0aWMgYnJhbmNoIGZvciBhIGRpdi4gSWYgWmloaW50cGF1c2UgaXMgdW5zdXBw
b3J0ZWQsIHdlIHRyYWRlIHRoZQo+Pj4+Pj4+Pj4+Pj4+IGp1bXAgZnJvbSB0aGUgc3RhdGljIGJy
YW5jaCBmb3IgKHdoYXQgZ2V0cyBpbnRlcnByZXRlZCBhcykgYSBub3AuCj4+Pj4+Pj4+Pj4+Pj4g
Cj4+Pj4+Pj4+Pj4+Pj4gRml4ZXM6IDhlYjA2MGUxMDE4NSAoImFyY2gvcmlzY3Y6IGFkZCBaaWhp
bnRwYXVzZSBzdXBwb3J0IikKPj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9s
bGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+
PiAKPj4+Pj4+Pj4+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAzIC0tLQo+
Pj4+Pj4+Pj4+Pj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8IDI1
ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4+Pj4+Pj4+Pj4+PiAyIGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4+Pj4+Pj4+PiBpbmRleCA2ZjU5ZWM2NDE3
NWUuLmIyMWQ0NmU2ODM4NiAxMDA2NDQKPj4+Pj4+Pj4+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4+Pj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPj4+Pj4+Pj4+Pj4+PiBAQCAtNjgsNyArNjgsNiBAQCBlbnVtIHJpc2N2X2lz
YV9leHRfaWQgewo+Pj4+Pj4+Pj4+Pj4+ICovCj4+Pj4+Pj4+Pj4+Pj4gZW51bSByaXNjdl9pc2Ff
ZXh0X2tleSB7Cj4+Pj4+Pj4+Pj4+Pj4gUklTQ1ZfSVNBX0VYVF9LRVlfRlBVLCAvKiBGb3IgJ0Yn
IGFuZCAnRCcgKi8KPj4+Pj4+Pj4+Pj4+PiAtIFJJU0NWX0lTQV9FWFRfS0VZX1pJSElOVFBBVVNF
LAo+Pj4+Pj4+Pj4+Pj4+IFJJU0NWX0lTQV9FWFRfS0VZX01BWCwKPj4+Pj4+Pj4+Pj4+PiB9Owo+
Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+IEBAIC04OCw4ICs4Nyw2IEBAIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgaW50IHJpc2N2X2lzYV9leHQya2V5KGludCBudW0pCj4+Pj4+Pj4+Pj4+Pj4g
cmV0dXJuIFJJU0NWX0lTQV9FWFRfS0VZX0ZQVTsKPj4+Pj4+Pj4+Pj4+PiBjYXNlIFJJU0NWX0lT
QV9FWFRfZDoKPj4+Pj4+Pj4+Pj4+PiByZXR1cm4gUklTQ1ZfSVNBX0VYVF9LRVlfRlBVOwo+Pj4+
Pj4+Pj4+Pj4+IC0gY2FzZSBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFOgo+Pj4+Pj4+Pj4+Pj4+
IC0gcmV0dXJuIFJJU0NWX0lTQV9FWFRfS0VZX1pJSElOVFBBVVNFOwo+Pj4+Pj4+Pj4+Pj4+IGRl
ZmF1bHQ6Cj4+Pj4+Pj4+Pj4+Pj4gcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4+Pj4+Pj4gfQo+Pj4+
Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vz
c29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPj4+Pj4+Pj4+
Pj4+PiBpbmRleCAxZTRmOGI0YWVmNzkuLjc4OWJkYjgyMTFhMiAxMDA2NDQKPj4+Pj4+Pj4+Pj4+
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPj4+Pj4+Pj4+
Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPj4+Pj4+
Pj4+Pj4+PiBAQCAtNCwzMCArNCwyNSBAQAo+Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+ICNp
Zm5kZWYgX19BU1NFTUJMWV9fCj4+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+Pj4gLSNpbmNsdWRl
IDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4+Pj4+Pj4+Pj4+Pj4gI2luY2x1ZGUgPGFzbS9iYXJyaWVy
Lmg+Cj4+Pj4+Pj4+Pj4+Pj4gLSNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPj4+Pj4+Pj4+Pj4+PiAK
Pj4+Pj4+Pj4+Pj4+PiBzdGF0aWMgaW5saW5lIHZvaWQgY3B1X3JlbGF4KHZvaWQpCj4+Pj4+Pj4+
Pj4+Pj4gewo+Pj4+Pj4+Pj4+Pj4+IC0gaWYgKCFzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zf
aXNhX2V4dF9rZXlzW1JJU0NWX0lTQV9FWFRfS0VZX1pJSElOVFBBVVNFXSkpIHsKPj4+Pj4+Pj4+
Pj4+PiAjaWZkZWYgX19yaXNjdl9tdWxkaXYKPj4+Pj4+Pj4+Pj4+PiAtIGludCBkdW1teTsKPj4+
Pj4+Pj4+Pj4+PiAtIC8qIEluIGxpZXUgb2YgYSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBs
b25nLWxhdGVuY3kgc3RhbGwuICovCj4+Pj4+Pj4+Pj4+Pj4gLSBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPj4+Pj4+Pj4+Pj4+PiArIGlu
dCBkdW1teTsKPj4+Pj4+Pj4+Pj4+PiArIC8qIEluIGxpZXUgb2YgYSBoYWx0IGluc3RydWN0aW9u
LCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kgc3RhbGwuICovCj4+Pj4+Pj4+Pj4+Pj4gKyBfX2FzbV9f
IF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPj4+Pj4+
Pj4+Pj4+PiAjZW5kaWYKPj4+Pj4+Pj4+Pj4+PiAtIH0gZWxzZSB7Cj4+Pj4+Pj4+Pj4+Pj4gLSAv
Kgo+Pj4+Pj4+Pj4+Pj4+IC0gKiBSZWR1Y2UgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudC4KPj4+Pj4+
Pj4+Pj4+PiAtICogVGhpcyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgo+Pj4+Pj4+Pj4+Pj4+IC0g
Ki8KPj4+Pj4+Pj4+Pj4+PiArIC8qCj4+Pj4+Pj4+Pj4+Pj4gKyAqIFJlZHVjZSBpbnN0cnVjdGlv
biByZXRpcmVtZW50Lgo+Pj4+Pj4+Pj4+Pj4+ICsgKiBUaGlzIGFzc3VtZXMgdGhlIFBDIGNoYW5n
ZXMuCj4+Pj4+Pj4+Pj4+Pj4gKyAqLwo+Pj4+Pj4+Pj4+Pj4+ICNpZmRlZiBfX3Jpc2N2X3ppaGlu
dHBhdXNlCj4+Pj4+Pj4+Pj4+Pj4gLSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7Cj4+
Pj4+Pj4+Pj4+Pj4gKyBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7Cj4+Pj4+Pj4+Pj4+
Pj4gI2Vsc2UKPj4+Pj4+Pj4+Pj4+PiAtIC8qIEVuY29kaW5nIG9mIHRoZSBwYXVzZSBpbnN0cnVj
dGlvbiAqLwo+Pj4+Pj4+Pj4+Pj4+IC0gX19hc21fXyBfX3ZvbGF0aWxlX18gKCIuNGJ5dGUgMHgx
MDAwMDBGIik7Cj4+Pj4+Pj4+Pj4+Pj4gKyAvKiBFbmNvZGluZyBvZiB0aGUgcGF1c2UgaW5zdHJ1
Y3Rpb24gKi8KPj4+Pj4+Pj4+Pj4+PiArIF9fYXNtX18gX192b2xhdGlsZV9fICgiLjRieXRlIDB4
MTAwMDAwRiIpOwo+Pj4+Pj4+Pj4+Pj4+ICNlbmRpZgo+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+
PiBobW0sIHRob3VnaCBiZWZvcmUgdGhpcyBwYXJ0IG9mIHRoZSBjb2RlIHdhcyBvbmx5IGV2ZXIg
YWNjZXNzZWQKPj4+Pj4+Pj4+Pj4+IHdoZW4gdGhlIHpoaW50cGF1c2UgZXh0ZW5zaW9uIHdhcyBy
ZWFsbHkgYXZhaWxhYmxlIG9uIHRoZSBydW5uaW5nCj4+Pj4+Pj4+Pj4+PiBtYWNoaW5lIHdoaWxl
IG5vdyB0aGUgcGF1c2UgaW5zdHJ1Y3Rpb24gaXMgY2FsbGVkIGV2ZXJ5IHRpbWUuCj4+Pj4+Pj4+
Pj4+PiAKPj4+Pj4+Pj4+Pj4+IFNvIEknbSBqdXN0IHdvbmRlcmluZywgY2FuJ3QgdGhpcyBydW4g
aW50byBzb21lICJpbGxlZ2FsIGluc3RydWN0aW9uIgo+Pj4+Pj4+Pj4+Pj4gdGhpbmd5IG9uIG1h
Y2hpbmVzIG5vdCBzdXBwb3J0aW5nIHRoZSBleHRlbnNpb24/Cj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+
Pj4+PiBOby4gVGhlIGVuY29kaW5nIGZvciBwYXVzZSB3YXMgZGVsaWJlcmF0ZWx5IGNob3NlbiB0
byBiZSBvbmUgb2YgdGhlCj4+Pj4+Pj4+Pj4+IOKAnHVzZWxlc3PigJ0gZW5jb2RpbmdzIG9mIGZl
bmNlLCB3aXRoIHRoZSBob3BlIHRoYXQgZXhpc3RpbmcKPj4+Pj4+Pj4+Pj4gbWljcm9hcmNoaXRl
Y3R1cmVzIG1pZ2h0IHRha2UgYSB3aGlsZSB0byBleGVjdXRlIGl0IGFuZCB0aHVzIGl0IHdvdWxk
Cj4+Pj4+Pj4+Pj4+IHN0aWxsIGZ1bmN0aW9uIGFzIGEgc2xvdy1ydW5uaW5nIGluc3RydWN0aW9u
LiBJdOKAmXMgc29tZXdoYXQKPj4+Pj4+Pj4+Pj4gcXVlc3Rpb25hYmxlIHdoZXRoZXIgdGhlIGRp
diBpcyBldmVuIG5lZWRlZCwgdGhlIHdvcnN0IHRoYXQgaGFwcGVucyBpcwo+Pj4+Pj4+Pj4+PiBj
cHVfcmVsYXggaXNu4oCZdCB2ZXJ5IHJlbGF4ZWQgYW5kIHlvdSBzcGluIGEgYml0IGZhc3Rlci4g
QW55Cj4+Pj4+Pj4+Pj4+IGltcGxlbWVudGF0aW9ucyB3aGVyZSB0aGF04oCZcyB0cnVlIHByb2Jh
Ymx5IGFsc28gZG9u4oCZdCBoYXZlIGZhbmN5Cj4+Pj4+Pj4+Pj4+IGNsb2NrL3Bvd2VyIG1hbmFn
ZW1lbnQgYW55d2F5LCBhbmQgZGl2IGlzbuKAmXQgZ29pbmcgdG8gYmUgYSBsb3ctcG93ZXIKPj4+
Pj4+Pj4+Pj4gb3BlcmF0aW9uIHNvIHRoZSBvbmx5IHJlYWwgZWZmZWN0IGlzIGxpa2VseSBoYW1t
ZXJpbmcgb24gY29udGVuZGVkCj4+Pj4+Pj4+Pj4+IGF0b21pY3MgYSBiaXQgbW9yZSwgYW5kIHdo
byBjYXJlcyBhYm91dCB0aGF0IG9uIHRoZSBsb3cgY29yZSBjb3VudAo+Pj4+Pj4+Pj4+PiBzeXN0
ZW1zIHdlIGhhdmUgdG9kYXkuCj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4gdGhhbmtzIGEgbG90IGZv
ciB0aGF0IGV4cGxhbmF0aW9uLCB3aGljaCBtYWRlIHRoaW5ncyBhIGxvdCBjbGVhcmVyLgo+Pj4+
Pj4+Pj4+IAo+Pj4+Pj4+Pj4+IFNvIGFzIHlvdSBzYWlkLCBkcm9wcGluZyB0aGUgZGl2IHBhcnQg
bWlnaHQgbWFrZSB0aGUgZnVuY3Rpb24gZXZlbiBzbWFsbGVyLAo+Pj4+Pj4+Pj4+IHRob3VnaCBz
b21laG93IHBhcnQgb2YgbWUgd291bGQgd2FudCB0byBhZGQgc29tZSBzb3J0IG9mIGNvbW1lbnQg
dG8KPj4+Pj4+Pj4+PiB0aGUgZnVuY3Rpb24gZm9yIHdoZW4gdGhlIG5leHQgZGV2ZWxvcGVyIHN0
dW1ibGVzIG92ZXIgdGhlIHVuY29uZGl0aW9uYWwKPj4+Pj4+Pj4+PiB1c2Ugb2YgcGF1c2UgOi0p
IC4KPj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4gSSBhZ3JlZS4gSWYgdGhhdCdzIHdo
YXQgbWljcm9hcmNoIHdpbGwgZG8sIHdlIGNhbiBkcm9wIGRpdiBhbHRvZ2V0aGVyLgo+Pj4+Pj4+
Pj4gVGhvdWdoIG1pY3JvYXJjaCBtYXkgYmUgdHJlYXRlZCBhcyBub3AgZXZlbiBpZiBpdCBpcyB1
bmRlc2lyYWJsZS4KPj4+Pj4+Pj4+IElJUkMsIHRoZSBkaXYgd2FzIGludHJvZHVjZWQgZm9yIHRo
ZSByb2NrZXQgY2hpcCB3aGljaCB3b3VsZCBpbmR1Y2UgYQo+Pj4+Pj4+Pj4gbG9uZyBsYXRlbmN5
IHN0YWxsIHdpdGggZGl2IGluc3RydWN0aW9uICh6ZXJvIGFzIG9wZXJhbmRzKS4KPj4+Pj4+Pj4+
IAo+Pj4+Pj4+Pj4gRG9lcyBhbnkgb3RoZXIgY29yZSBvciBuZXdlciByb2NrZXQgY2hpcCBhY3R1
YWxseSBpbmR1Y2UgYSBsYXRlbmN5Cj4+Pj4+Pj4+PiBzdGFsbCB3aXRoIGRpdiBpbnN0cnVjdGlv
biA/Cj4+Pj4+Pj4+PiBJZiBub3QsIGl0IGlzIGVxdWl2YWxlbnQgdG8gTk9QIGFzIHdlbGwuIFdl
IGNhbiBkZWZpbml0ZWx5IHJlbW92ZSB0aGUgZGl2Lgo+Pj4+Pj4+Pj4gVGhlIG9ubHkgY29yZXMg
YWZmZWN0ZWQgd2lsbCBiZSB0aGUgb2xkZXIgcm9ja2V0IGNvcmUuCj4+Pj4+Pj4+PiAKPj4+Pj4+
Pj4+IFRhZ2dpbmcgc29tZSBmb2xrcyB0byB1bmRlcnN0YW5kIHdoYXQgdGhlaXIgY29yZSBkb2Vz
Lgo+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+PiBAUGF1bCBXYWxtc2xleSBAR3VvIFJlbiBAQ29ub3IgRG9v
bGV5ID8KPj4+Pj4+Pj4gCj4+Pj4+Pj4+IEkgYW0gbm8gbWljcm9hcmNoIGV4cGVydCBieSBfYW55
XyBzdHJldGNoIG9mIHRoZSBpbWFnaW5hdGlvbiwgYnV0Cj4+Pj4+Pj4+IGZyb20gYSBxdWljayBl
eHBlcmltZW50IGl0IGxvb2tzIGxpa2UgdGhlIHU1NHMgb24gUG9sYXJGaXJlIFNvQyBiZWhhdmUK
Pj4+Pj4+Pj4gaW4gdGhlIHNhbWUgd2F5LCBhbmQgZGl2IHcvIHplcm8gb3BlcmFuZHMgZG9lcyBp
biBmYWN0IHRha2Ugc2lnbmlmaWNhbnRseQo+Pj4+Pj4+PiBsb25nZXIgdGhhbiByZWd1bGFyIGRp
dmlzaW9uIChsb29rcyB0byBiZSBhYm91dCAzeCkuCj4+Pj4+Pj4+IAo+Pj4+Pj4+IAo+Pj4+Pj4+
IFRoYW5rcy4gRG8geW91IGhhdmUgYW55IGRhdGEgb24gaG93IG11Y2ggdGhlICJwYXVzZSIgaW5z
dHJ1Y3Rpb24gdGFrZXMuCj4+Pj4+PiAKPj4+Pj4+IFNvIHRoZXNlIG51bWJlcnMgeW91IG1heSBj
b25zaWRlciBhcyBiZWluZyBwdWxsZWQgb3V0IG9mIGEgbWFnaWMgaGF0Cj4+Pj4+PiBhcyBhbGwg
SSBhbSBkb2luZyBpcyByZWFkaW5nIHRoZSBjb3VudGVycyBmcm9tIHVzZXJzcGFjZSBhbmQgdGhl
cmUgaXMKPj4+Pj4+IHNvbWUgdmFyaWFuY2UgZXRjLiBQbHVzIHRoZSBmYWN0IHRoYXQgSSBqdXN0
IHN0YXJ0ZWQgaGFja2luZyBhdCBzb21lCj4+Pj4+PiBleGlzdGluZyBjb2RlIEkgaGFkIGx5aW5n
IGFyb3VuZCBhcyBJJ20gcHJldHR5IHNub3dlZCB1bmRlciBhdCB0aGUKPj4+Pj4+IG1vbWVudC4K
Pj4+Pj4+IAo+Pj4+Pj4gRG9pbmcgdGhlIGZvbGxvd2luZyB0YWtlcyBhYm91dCA3MCBjeWNsZXMg
b24gYm90aCBhIFBvbGFyRmlyZSBTb0MgYW5kIGFuCj4+Pj4+PiB1bm1hdGNoZWQ6Cj4+Pj4+PiBs
b25nIGRpdmlzb3IgPSAyLCBkaXZpZGVuZCA9IDEwMDAwMCwgZGVzdDsKPj4+Pj4+IGFzbSgiZGl2
ICUwLCB6ZXJvLCB6ZXJvIiA6ICI9ciIgKGRlc3QpKTsKPj4+Pj4+IGFuZCBlcXVhdGVzIHRvOgo+
Pj4+Pj4gc2QgYTUsLTQ4KHMwKQo+Pj4+Pj4gZGl2IGE1LHplcm8semVybwo+Pj4+Pj4gCj4+Pj4+
PiBDbG9ja2luZyBpbiBhdCBhYm91dCA0MCBjeWNsZXMgaXMgc29tZSBhY3R1YWwgZGl2aXNpb25z
LCBJIGp1c3QgZGlkIHRoZQo+Pj4+Pj4gZm9sbG93aW5nIGEgZG96ZW4gdGltZXMsIGRvaW5nIGEg
dHJpdmlhbCBjb21wdXRhdGlvbjoKPj4+Pj4+IGxvbmcgZGl2aXNvciA9IDIsIGRpdmlkZW5kID0g
MTAwMDAwLCBkZXN0Owo+Pj4+Pj4gYXNtKCJkaXYgJTAsICUxLCAlMiIgOiAiPXIiIChkaXZpZGVu
ZCkgOiAiciIgKGRpdmlkZW5kKSwgInIiIChkaXZpc29yKSkKPj4+Pj4+IAo+Pj4+Pj4gaWUsIGEg
bG9hZCBvZiB0aGUgZm9sbG93aW5nOgo+Pj4+Pj4gc2QgYTUsLTQ4KHMwKQo+Pj4+Pj4gbGQgYTUs
LTQ4KHMwKQo+Pj4+Pj4gbGQgYTQsLTQwKHMwKQo+Pj4+Pj4gZGl2IGE1LGE1LGE0Cj4+Pj4+PiAK
Pj4+Pj4+IFNvIGNsZWFybHkgdGhlIGRpdiB3LyB6ZXJvIGFyZ3MgbWFrZXMgYSBkaWZmZXJlbmNl
Li4uCj4+Pj4+PiAKPj4+Pj4+IE9uIFBvbGFyRmlyZSBTb0MsIGAweDEwMDAwMEZgIHRha2VzIGFw
cHJveCA2IGN5Y2xlcy4gT24gbXkgdW5tYXRjaGVkLCBpdAo+Pj4+Pj4gdGFrZXMgYXBwcm94IDQw
LiBBZ2FpbiwgSSBqdXN0IGhhZCBhbiBhc20gYmxvY2sgJiBjYWxsZWQgdGhlIGluc3RydWN0aW9u
Cj4+Pj4+PiBhIG51bWJlciB0aW1lcyBhbmQgdG9vayB0aGUgYXZlcmFnZSAtIGhlcmUgaXQgd2Fz
IDQ4IHRpbWVzLgo+Pj4+Pj4gCj4+Pj4+PiBUYWtlIHRoZSBhY3R1YWwgbnVtYmVycyB3aXRoIGEg
ZmlzdCBmdWxsIG9mIHNhbHQsIGJ1dCBhdCBsZWFzdCB0aGUKPj4+Pj4+IHJlbGF0aXZlIG51bWJl
cnMgc2hvdWxkIGJlIG9mIHNvbWUgdXNlIHRvIHlvdS4KPj4+Pj4+IAo+Pj4+Pj4gSG9wZSB0aGF0
J3Mgc29tZXdoYXQgaGVscGZ1bCwgbWF5YmUgbmV4dCB3ZWVrIEkgY2FuIGRvIHNvbWV0aGluZyBh
Cj4+Pj4+PiBsaXR0bGUgbW9yZSB1c2VmdWwgZm9yIHlvdS4uLgo+Pj4+Pj4gCj4+Pj4+IAo+Pj4+
PiBUaGFua3MuIEl0IHdvdWxkIGJlIGdvb2QgdG8gdW5kZXJzdGFuZCB3aGF0IGhhcHBlbnMgd2hl
biAicGF1c2UiIGlzCj4+Pj4+IGV4ZWN1dGVkIG9uIHRoZXNlIGJvYXJkcyA/Cj4+Pj4gCj4+Pj4g
VGhlIGFjdHVhbCBwYXVzZSBpbnN0cnVjdGlvbj8gdWhoLCBzbyB3aXRoIHRoZSB1c3VhbCAiSSBk
b24ndCBrbm93IHdoYXQKPj4+PiBJIGFtIGRvaW5nIiBkaXNjbGFpbWVyLCBJIHJhbiBlYWNoIG9m
IHRoZSAuaW5zbiBhbmQgcGF1c2UgaW5zdHJ1Y3Rpb24gNDgKPj4+PiB0aW1lcyBpbiBhIHJvdyBh
bmQgY2hlY2tlZCB0aGUgdGltZSBlbGFwc2VkIHZpYSByZGN5Y2xlICYgdGhlbiByYW4gdGhhdAo+
Pj4+IGMgcHJvZ3JhbSAxMDAwIHRpbWVzIGluIGEgYmFzaCBsb29wLiBHb3QgdGhlIGJlbG93LCB0
aGUgaW5zbnMgd2VyZSBydW4KPj4+PiBmaXJzdCBhbmQgdGhlbiB0aGUgcGF1c2VzLgo+Pj4+IGlu
c24gcGF1c2UKPj4+PiBtaW4gMi4zIDMuMgo+Pj4+IG1heCA5LjUgMTAuNgo+Pj4+IGF2ZyAyNy4w
IDI5LjEKPj4+PiA1JSAyLjkgNC4yCj4+Pj4gOTUlIDE4LjEgMTkuMQo+Pj4+IAo+Pj4+IFN3YXBw
aW5nIHRoZSBwYXVzZSAmIGluc24gb3JkZXIgYXJvdW5kIG1hZGUgYSBtaW5vciBkaWZmZXJlbmNl
LCBidXQgbm90Cj4+Pj4gZW5vdWdoIHRvIHJlcG9ydCBvbi4gSSdkIGJlIHZlcnkgd2FyeSBvZiBk
cmF3aW5nIGFueSByZWFsIGNvbmNsdXNpb25zCj4+Pj4gZnJvbSB0aGlzIGRhdGEsIGJ1dCBhdCBs
ZWFzdCBib3RoIGFyZSByb3VnaGx5IHNpbWlsYXIgKGFuZCBjZXJ0YWlubHkgbm90Cj4+Pj4gZXZl
biBjbG9zZSB0byBkb2luZyB0aGUgZGl2IHcvIHplcm8gYXJncy4KPj4+PiAKPj4+IAo+Pj4gWWVh
aC4gVGhhdCdzIHdoYXQgSSB3YXMgZXhwZWN0aW5nLiBTbyB3ZSBjYW4ndCBkcm9wIHRoZSBkaXYg
Zm9yIG5vdy4gT3RoZXJ3aXNlLAo+Pj4gdGhlIGV4aXN0aW5nIGhhcmR3YXJlKGRvbid0IHN1cHBv
cnQgWmhpbnRwYXVzZSkgc3VmZmVycyBieSBzcGlubmluZyBmYXN0ZXIuCj4+IAo+PiBCdXQgZG9l
cyB0aGF0IGFjdHVhbGx5IG1hdHRlciBpbiBwcmFjdGljZT8gSWYgaXQgZG9lc27igJl0IG5vdGlj
ZWFibGUKPj4gYWZmZWN0IHBlcmZvcm1hbmNlIHRoZW4geW91IGRvbuKAmXQgbmVlZCB0byBrZWVw
IHRoZSBkaXYuIFRoZXJlIGFyZSBhIGxvdAo+PiBvZiBhcmNoaXRlY3R1cmVzIHRoYXQgZXZlbiBq
dXN0IGRlZmluZSBjcHVfcmVsYXgoKSBhcyBiYXJyaWVyKCkuCj4gRGl2IGlzIG5vdCBzZW1hbnRp
YyBhY2N1cmF0ZSBmb3Igc3RhbmRhcmQgY29kZSwgaXQgc2hvdWxkIGJlIGluCj4gdmVuZG9ycycg
ZXJyYXRhLiBJIGFncmVlIHRvIGxlYXZlIG5vcCBhcyBkZWZhdWx0IGFuZCBwdXQgYSBwYXVzZQo+
IGluc3RlYWQgYWZ0ZXIgdGhlIGZlYXR1cmUgaXMgZGV0ZWN0ZWQuCgpOb2JvZHnigJlzIHN1Z2dl
c3RpbmcgYSBsaXRlcmFsIG5vcCBpbnN0cnVjdGlvbiwgdGhhdCB3b3VsZCBiZSB3b3JzZSB0aGFu
CmVpdGhlciBkaXYgb3IgcGF1c2UuIEl04oCZcyBhbHdheXMgc2FmZSB0byBleGVjdXRlIHBhdXNl
LCB0aGUgcXVlc3Rpb24gaXMKanVzdCB3aGV0aGVyIG9uIGV4aXN0aW5nIHN5c3RlbXMgdGhhdCBk
b27igJl0IGltcGxlbWVudCBaaWhpbnRwYXVzZSBpdApnZXRzIGV4ZWN1dGVkIHRvbyBxdWlja2x5
IHN1Y2ggdGhhdCBwZXJmb3JtYW5jZSBpcyBkZWdyYWRlZCBkdWUgdG8Kc3Bpbm5pbmcgbW9yZSBh
Z2dyZXNzaXZlbHkuCgpKZXNzCgo+PiAKPj4gSmVzcwo+PiAKPj4+IFRoYW5rcyBmb3IgcnVubmlu
ZyB0aGUgZXhwZXJpbWVudHMuCj4+PiAKPj4+PiBBZ2FpbiwgaG9wZSB0aGF0IGlzIGhlbHBmdWw/
Cj4+Pj4gQ29ub3IuCj4+Pj4gCj4+Pj4+IAo+Pj4+Pj4gQ29ub3IuCj4+Pj4+PiAKPj4+Pj4+PiBJ
IHVuZGVyc3RhbmQgdGhhdCBpdCBpcyBub3QgYXZhaWxhYmxlIGluIHRoZXNlIGNvcmVzLiBKdXN0
IHdhbnRlZCB0bwo+Pj4+Pj4+IHVuZGVyc3RhbmQgaWYgbWljcm9hcmNoaXRlY3R1cmUKPj4+Pj4+
PiBhY3R1YWxseSB0YWtlcyBhIHdoaWxlIGV4ZWN1dGluZyB0aGUgdXNlbGVzcyBlbmNvZGluZyBh
cyBwb2ludGVkIG91dCBieSBKZXNzaWNhLgo+Pj4+Pj4+IAo+Pj4+Pj4+IElmIHRoYXQncyB0aGUg
Y2FzZSwgd2UgY2FuIHJlbW92ZSB0aGUgZGl2IGluc3RydWN0aW9uIGFsdG9nZXRoZXIuCj4+Pj4+
Pj4gT3RoZXJ3aXNlLCB0aGlzIHBhdGNoIHdpbGwgY2F1c2Ugc29tZSBwZXJmb3JtYW5jZSByZWdy
ZXNzaW9uCj4+Pj4+Pj4gZm9yIGV4aXN0aW5nIFNvQyAoSGlGaXZlIHVubGVhc2hlZCBoYXMgdGhl
IHNhbWUgY29yZS4gTm90IHN1cmUgYWJvdXQKPj4+Pj4+PiB1bm1hdGNoZWQgdGhvdWdoKS4KPj4+
Pj4+PiBUaGlzIG5lZWRzIHRvIGJlIGRvY3VtZW50ZWQgYXQgbGVhc3QuCj4+Pj4+Pj4gCj4+Pj4+
Pj4+IEhvcGUgdGhhdCdzIGhlbHBmdWwsCj4+Pj4+Pj4+IENvbm9yLgo+Pj4+Pj4+PiAKPj4+Pj4+
Pj4gKEkganVzdCBkaWQgYSBxdWljayBjaGVjayBvZiB3aGF0IHByZXR0eSBtdWNoIGFtb3VudGVk
IHRvIGEgYnVuY2ggb2YKPj4+Pj4+Pj4gZGl2IGE1LHplcm8semVybyBpbiBhIHJvdyB2ZXJzdXMg
ZGl2IGE1LGE1LGE1KQo+Pj4+Pj4+PiAKPj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4gKFBsZWFzZSBhZGQg
YW55Ym9keSB3aG8gbWF5IGhhdmUgYW4gaW5zaWdodCB0byBleGVjdXRpb24gZmxvdyBvbgo+Pj4+
Pj4+Pj4gZXhpc3RpbmcgTGludXggY2FwYWJsZSBjb3JlcykKPj4+Pj4+Pj4+IAo+Pj4+IAo+Pj4g
Cj4+PiAKPj4+IC0tCj4+PiBSZWdhcmRzLAo+Pj4gQXRpc2gKPj4gCj4gCj4gCj4gLS0gCj4gQmVz
dCBSZWdhcmRzCj4gR3VvIFJlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
