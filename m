Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D53C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXmcvOtvZ00i15TT94JGvuZmoiQL67r2HeozOpRAwKU=; b=q6PuSuCtPRI7Hx
	P0osPYCSvh4+bEIwDlUAdlWUoVQV4/QlKRG8R7ItDqxAwJhD0zHX4rMk/XePc0u+xxZ/A32pVum0y
	B8r0SzZbl6R/GRGrlu3WY9Oj1nUKhF9yoAOlxT/0jAtedRsKGFcMwPYN5R8r20m2+r0rcvhY355cy
	3WE+uWPqKZw+KUp8k+3v+wB7JPtx3dlzXC6y+v1mNWy1J26YUWJbJWQuF6GuGld5mNxphrnFAtl7Q
	UjwhawvnlS2UzKUzooTiEpr62s918EavE94inbQ0+wSiQGI6gNjAI+0hI17AtTO0bGNKkbqOMlKkj
	C+RuyDvrfDtruW3q66Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5LB-00EVMW-8n; Wed, 05 Oct 2022 14:25:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5L7-00EVAJ-FM
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:25:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id b4so19265906wrs.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=YW0U49IJ9akiaPa3ZT/tCyDJCJ9H1v1xiGmSKPb9ZnY=;
        b=gN3VraA1EN+MVapKnD0wr7oLCkMm4oiDdxbpzZpJiHxMP1i4Iqlwd8GCsmUZylWdM0
         80qzw06S+JKFKrQC0Xwl3EGi4K5m6RvVeGZhcyL2d3WOQEmzfsHidDEqswq6Y4zVknL3
         BQLgPt2AwC5L/aRzx42jdX5N8sf/LH7RUzLNHcoe5NxNlCOHCUvM8YDVc+5bWLKXhL1k
         RnLof8oMcK5JEPBGAAslZhD9DvTwy/cGj1Vn1HFAQj7cV1PTlnCrgc47neoqrqvzYwF0
         Vsf/s5TZ1DkbCdArZhhrEXI568DPgSZuJhYN3nal4ZjeboEZZg2Uz5UPA8I+jm9cTjSU
         /B2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YW0U49IJ9akiaPa3ZT/tCyDJCJ9H1v1xiGmSKPb9ZnY=;
        b=1Wgl8eE7vf6gnz8YYGByxSW+rFNQ5/GbQUUICNipc70+f7331ZzuVifBj3fp2swYFy
         dlEOSuax21hbA8JN9vS3HYcsY1hLVzPDZCAe8UCNztRfSIKXkOINFSw+H5KTxfLyeGCE
         crXrutxjOCyI5u8sclF8JduxtEYg1fwfDEimkjPTHXvi8yEO3HeS+hVynFu6bUdkco+Z
         3nZrPlM5PKoMUuwZKYmHzxkuzASxKdpILSz7yq6ndlOar05TXdt0heDoTccb1EM/krVA
         VbxSiQX7W2sU+zKr7pNg+URZHEC95ZBxUv3oqphlwCsJ4q6LzKXP+u/6+t5EbIJi7qyM
         HTnw==
X-Gm-Message-State: ACrzQf3UbNHNlKiI5AuECTE762+jzterJ1D1HAd4JMd7KJVkoqFcg4iR
	+2fSPaU1Mcuiws1F3dymq84JtQ==
X-Google-Smtp-Source: AMsMyM6P1cwVqaIKfQ9xLVl1241oLDwsWCeAJuyhZ8kAKNsPA//DdGxeqShBe3vPKyKXk9giQ+naLg==
X-Received: by 2002:a05:6000:1788:b0:22e:3d0f:2547 with SMTP id e8-20020a056000178800b0022e3d0f2547mr10564561wrg.621.1664979933480;
        Wed, 05 Oct 2022 07:25:33 -0700 (PDT)
Received: from smtpclient.apple (global-5-142.n-2.net.cam.ac.uk. [131.111.5.142])
        by smtp.gmail.com with ESMTPSA id i8-20020a1c3b08000000b003b535ad4a5bsm2218476wma.9.2022.10.05.07.25.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Oct 2022 07:25:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAJF2gTTMJqpYdm4ebnBp8df0HfQSD0RBK5xNVa=mQbq0djBrYQ@mail.gmail.com>
Date: Wed, 5 Oct 2022 15:25:32 +0100
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
Message-Id: <B496688F-28CA-43E7-8D87-0E61AA17E6D5@jrtc27.com>
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
 <1CECF1C3-6FA1-49CC-8A7A-1E18E401B88B@jrtc27.com>
 <CAJF2gTTMJqpYdm4ebnBp8df0HfQSD0RBK5xNVa=mQbq0djBrYQ@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_072537_621981_365D76A2 
X-CRM114-Status: GOOD (  35.06  )
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

T24gNSBPY3QgMjAyMiwgYXQgMDI6NDAsIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90
ZToKPiAKPiAsCj4gCj4gT24gV2VkLCBPY3QgNSwgMjAyMiBhdCA5OjAxIEFNIEplc3NpY2EgQ2xh
cmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiA1IE9jdCAyMDIyLCBhdCAw
MTozOCwgR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gCj4+PiBPbiBXZWQs
IE9jdCA1LCAyMDIyIGF0IDE6MjQgQU0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29t
PiB3cm90ZToKPj4+PiAKPj4+PiBPbiA0IE9jdCAyMDIyLCBhdCAxNzo1MiwgQXRpc2ggUGF0cmEg
PGF0aXNocEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBPbiBTYXQsIE9jdCAx
LCAyMDIyIGF0IDE6MTMgUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToK
Pj4+Pj4+IAo+Pj4+Pj4gT24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMDg6MjY6MDFQTSAtMDcwMCwg
QXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4+Pj4gT24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMjoxNiBQ
TSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4+PiAKPj4+Pj4+
Pj4gT24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMTI6MjE6NTVBTSAtMDcwMCwgQXRpc2ggUGF0cmEg
d3JvdGU6Cj4+Pj4+Pj4+PiBPbiBTYXQsIFNlcCAyNCwgMjAyMiBhdCA0OjE1IFBNIENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4gT24g
RnJpLCBTZXAgMjMsIDIwMjIgYXQgMTE6MDE6MjhBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6
Cj4+Pj4+Pj4+Pj4+IE9uIEZyaSwgU2VwIDIzLCAyMDIyIGF0IDEyOjE4IEFNIEhlaWtvIFN0dWVi
bmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+PiBI
aSwKPj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4gQW0gRG9ubmVyc3RhZywgMjIuIFNlcHRlbWJl
ciAyMDIyLCAxNzo1Mjo0NiBDRVNUIHNjaHJpZWIgSmVzc2ljYSBDbGFya2U6Cj4+Pj4+Pj4+Pj4+
Pj4gT24gMjIgU2VwdCAyMDIyLCBhdCAxNjo0NSwgSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVj
aC5kZT4gd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+PiBBbSBEb25uZXJzdGFn
LCAyMi4gU2VwdGVtYmVyIDIwMjIsIDA4OjA5OjU4IENFU1Qgc2NocmllYiBTYW11ZWwgSG9sbGFu
ZDoKPj4+Pj4+Pj4+Pj4+Pj4+IGNvbW1pdCA4ZWIwNjBlMTAxODUgKCJhcmNoL3Jpc2N2OiBhZGQg
WmloaW50cGF1c2Ugc3VwcG9ydCIpIGJyb2tlCj4+Pj4+Pj4+Pj4+Pj4+PiBidWlsZGluZyB3aXRo
IENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBlbmFibGVkIChnY2MgMTEuMS4wKToKPj4+Pj4+
Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+Pj4gQ0MgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0
dGltZW9mZGF5Lm8KPj4+Pj4+Pj4+Pj4+Pj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFu
ZC1saW5lPjoKPj4+Pj4+Pj4+Pj4+Pj4+IC4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9qdW1wX2xh
YmVsLmg6IEluIGZ1bmN0aW9uICdjcHVfcmVsYXgnOgo+Pj4+Pj4+Pj4+Pj4+Pj4gLi8uL2luY2x1
ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoyODU6MzM6IHdhcm5pbmc6ICdhc20nIG9wZXJhbmQg
MCBwcm9iYWJseSBkb2VzIG5vdCBtYXRjaCBjb25zdHJhaW50cwo+Pj4+Pj4+Pj4+Pj4+Pj4gMjg1
IHwgI2RlZmluZSBhc21fdm9sYXRpbGVfZ290byh4Li4uKSBhc20gZ290byh4KQo+Pj4+Pj4+Pj4+
Pj4+Pj4gfCBefn4KPj4+Pj4+Pj4+Pj4+Pj4+IC4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9qdW1w
X2xhYmVsLmg6NDE6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdhc21fdm9sYXRpbGVf
Z290bycKPj4+Pj4+Pj4+Pj4+Pj4+IDQxIHwgYXNtX3ZvbGF0aWxlX2dvdG8oCj4+Pj4+Pj4+Pj4+
Pj4+PiB8IF5+fn5+fn5+fn5+fn5+fn5+Cj4+Pj4+Pj4+Pj4+Pj4+PiAuLy4vaW5jbHVkZS9saW51
eC9jb21waWxlcl90eXBlcy5oOjI4NTozMzogZXJyb3I6IGltcG9zc2libGUgY29uc3RyYWludCBp
biAnYXNtJwo+Pj4+Pj4+Pj4+Pj4+Pj4gMjg1IHwgI2RlZmluZSBhc21fdm9sYXRpbGVfZ290byh4
Li4uKSBhc20gZ290byh4KQo+Pj4+Pj4+Pj4+Pj4+Pj4gfCBefn4KPj4+Pj4+Pj4+Pj4+Pj4+IC4v
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9qdW1wX2xhYmVsLmg6NDE6OTogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvICdhc21fdm9sYXRpbGVfZ290bycKPj4+Pj4+Pj4+Pj4+Pj4+IDQxIHwgYXNt
X3ZvbGF0aWxlX2dvdG8oCj4+Pj4+Pj4+Pj4+Pj4+PiB8IF5+fn5+fn5+fn5+fn5+fn5+Cj4+Pj4+
Pj4+Pj4+Pj4+PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ5OiBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXkub10gRXJyb3IgMQo+Pj4+Pj4+Pj4+Pj4+
Pj4gbWFrZTogKioqIFthcmNoL3Jpc2N2L01ha2VmaWxlOjEyODogdmRzb19wcmVwYXJlXSBFcnJv
ciAyCj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+IEhhdmluZyBhIHN0YXRpYyBicmFu
Y2ggaW4gY3B1X3JlbGF4KCkgaXMgcHJvYmxlbWF0aWMgYmVjYXVzZSB0aGF0Cj4+Pj4+Pj4+Pj4+
Pj4+PiBmdW5jdGlvbiBpcyB3aWRlbHkgaW5saW5lZCwgaW5jbHVkaW5nIGluIHNvbWUgcXVpdGUg
Y29tcGxleCBmdW5jdGlvbnMKPj4+Pj4+Pj4+Pj4+Pj4+IGxpa2UgaW4gdGhlIFZEU08uIEEgcXVp
Y2sgbWVhc3VyZW1lbnQgc2hvd3MgdGhpcyBzdGF0aWMgYnJhbmNoIGlzCj4+Pj4+Pj4+Pj4+Pj4+
PiByZXNwb25zaWJsZSBieSBpdHNlbGYgZm9yIGFyb3VuZCA0MCUgb2YgdGhlIGp1bXAgdGFibGUu
Cj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+IERyb3AgdGhlIHN0YXRpYyBicmFuY2gs
IHdoaWNoIGVuZHMgdXAgYmVpbmcgdGhlIHNhbWUgbnVtYmVyIG9mCj4+Pj4+Pj4+Pj4+Pj4+PiBp
bnN0cnVjdGlvbnMgYW55d2F5LiBJZiBaaWhpbnRwYXVzZSBpcyBzdXBwb3J0ZWQsIHdlIHRyYWRl
IHRoZSBub3AgZnJvbQo+Pj4+Pj4+Pj4+Pj4+Pj4gdGhlIHN0YXRpYyBicmFuY2ggZm9yIGEgZGl2
LiBJZiBaaWhpbnRwYXVzZSBpcyB1bnN1cHBvcnRlZCwgd2UgdHJhZGUgdGhlCj4+Pj4+Pj4+Pj4+
Pj4+PiBqdW1wIGZyb20gdGhlIHN0YXRpYyBicmFuY2ggZm9yICh3aGF0IGdldHMgaW50ZXJwcmV0
ZWQgYXMpIGEgbm9wLgo+Pj4+Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+Pj4+PiBGaXhlczogOGVi
MDYwZTEwMTg1ICgiYXJjaC9yaXNjdjogYWRkIFppaGludHBhdXNlIHN1cHBvcnQiKQo+Pj4+Pj4+
Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5v
cmc+Cj4+Pj4+Pj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+Pj4g
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMyAtLS0KPj4+Pj4+Pj4+Pj4+Pj4+IGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8IDI1ICsrKysrKysrKystLS0t
LS0tLS0tLS0tLS0KPj4+Pj4+Pj4+Pj4+Pj4+IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4+Pj4+Pj4+Pj4+IGluZGV4IDZmNTllYzY0MTc1ZS4uYjIx
ZDQ2ZTY4Mzg2IDEwMDY0NAo+Pj4+Pj4+Pj4+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oCj4+Pj4+Pj4+Pj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKPj4+Pj4+Pj4+Pj4+Pj4+IEBAIC02OCw3ICs2OCw2IEBAIGVudW0gcmlzY3ZfaXNh
X2V4dF9pZCB7Cj4+Pj4+Pj4+Pj4+Pj4+PiAqLwo+Pj4+Pj4+Pj4+Pj4+Pj4gZW51bSByaXNjdl9p
c2FfZXh0X2tleSB7Cj4+Pj4+Pj4+Pj4+Pj4+PiBSSVNDVl9JU0FfRVhUX0tFWV9GUFUsIC8qIEZv
ciAnRicgYW5kICdEJyAqLwo+Pj4+Pj4+Pj4+Pj4+Pj4gLSBSSVNDVl9JU0FfRVhUX0tFWV9aSUhJ
TlRQQVVTRSwKPj4+Pj4+Pj4+Pj4+Pj4+IFJJU0NWX0lTQV9FWFRfS0VZX01BWCwKPj4+Pj4+Pj4+
Pj4+Pj4+IH07Cj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+IEBAIC04OCw4ICs4Nyw2
IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHJpc2N2X2lzYV9leHQya2V5KGludCBudW0p
Cj4+Pj4+Pj4+Pj4+Pj4+PiByZXR1cm4gUklTQ1ZfSVNBX0VYVF9LRVlfRlBVOwo+Pj4+Pj4+Pj4+
Pj4+Pj4gY2FzZSBSSVNDVl9JU0FfRVhUX2Q6Cj4+Pj4+Pj4+Pj4+Pj4+PiByZXR1cm4gUklTQ1Zf
SVNBX0VYVF9LRVlfRlBVOwo+Pj4+Pj4+Pj4+Pj4+Pj4gLSBjYXNlIFJJU0NWX0lTQV9FWFRfWklI
SU5UUEFVU0U6Cj4+Pj4+Pj4+Pj4+Pj4+PiAtIHJldHVybiBSSVNDVl9JU0FfRVhUX0tFWV9aSUhJ
TlRQQVVTRTsKPj4+Pj4+Pj4+Pj4+Pj4+IGRlZmF1bHQ6Cj4+Pj4+Pj4+Pj4+Pj4+PiByZXR1cm4g
LUVJTlZBTDsKPj4+Pj4+Pj4+Pj4+Pj4+IH0KPj4+Pj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPj4+Pj4+Pj4+Pj4+Pj4+IGluZGV4IDFlNGY4YjRhZWY3
OS4uNzg5YmRiODIxMWEyIDEwMDY0NAo+Pj4+Pj4+Pj4+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4+Pj4+Pj4+Pj4+Pj4+PiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPj4+Pj4+Pj4+Pj4+Pj4+IEBAIC00LDMw
ICs0LDI1IEBACj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+ICNpZm5kZWYgX19BU1NF
TUJMWV9fCj4+Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4+IC0jaW5jbHVkZSA8bGludXgv
anVtcF9sYWJlbC5oPgo+Pj4+Pj4+Pj4+Pj4+Pj4gI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4+
Pj4+Pj4+Pj4+Pj4+PiAtI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+Pj4+Pj4+Pj4+Pj4+Pj4gCj4+
Pj4+Pj4+Pj4+Pj4+PiBzdGF0aWMgaW5saW5lIHZvaWQgY3B1X3JlbGF4KHZvaWQpCj4+Pj4+Pj4+
Pj4+Pj4+PiB7Cj4+Pj4+Pj4+Pj4+Pj4+PiAtIGlmICghc3RhdGljX2JyYW5jaF9saWtlbHkoJnJp
c2N2X2lzYV9leHRfa2V5c1tSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRV0pKSB7Cj4+Pj4+
Pj4+Pj4+Pj4+PiAjaWZkZWYgX19yaXNjdl9tdWxkaXYKPj4+Pj4+Pj4+Pj4+Pj4+IC0gaW50IGR1
bW15Owo+Pj4+Pj4+Pj4+Pj4+Pj4gLSAvKiBJbiBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlvbiwg
aW5kdWNlIGEgbG9uZy1sYXRlbmN5IHN0YWxsLiAqLwo+Pj4+Pj4+Pj4+Pj4+Pj4gLSBfX2FzbV9f
IF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPj4+Pj4+
Pj4+Pj4+Pj4+ICsgaW50IGR1bW15Owo+Pj4+Pj4+Pj4+Pj4+Pj4gKyAvKiBJbiBsaWV1IG9mIGEg
aGFsdCBpbnN0cnVjdGlvbiwgaW5kdWNlIGEgbG9uZy1sYXRlbmN5IHN0YWxsLiAqLwo+Pj4+Pj4+
Pj4+Pj4+Pj4gKyBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1y
IiAoZHVtbXkpKTsKPj4+Pj4+Pj4+Pj4+Pj4+ICNlbmRpZgo+Pj4+Pj4+Pj4+Pj4+Pj4gLSB9IGVs
c2Ugewo+Pj4+Pj4+Pj4+Pj4+Pj4gLSAvKgo+Pj4+Pj4+Pj4+Pj4+Pj4gLSAqIFJlZHVjZSBpbnN0
cnVjdGlvbiByZXRpcmVtZW50Lgo+Pj4+Pj4+Pj4+Pj4+Pj4gLSAqIFRoaXMgYXNzdW1lcyB0aGUg
UEMgY2hhbmdlcy4KPj4+Pj4+Pj4+Pj4+Pj4+IC0gKi8KPj4+Pj4+Pj4+Pj4+Pj4+ICsgLyoKPj4+
Pj4+Pj4+Pj4+Pj4+ICsgKiBSZWR1Y2UgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudC4KPj4+Pj4+Pj4+
Pj4+Pj4+ICsgKiBUaGlzIGFzc3VtZXMgdGhlIFBDIGNoYW5nZXMuCj4+Pj4+Pj4+Pj4+Pj4+PiAr
ICovCj4+Pj4+Pj4+Pj4+Pj4+PiAjaWZkZWYgX19yaXNjdl96aWhpbnRwYXVzZQo+Pj4+Pj4+Pj4+
Pj4+Pj4gLSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInBhdXNlIik7Cj4+Pj4+Pj4+Pj4+Pj4+PiAr
IF9fYXNtX18gX192b2xhdGlsZV9fICgicGF1c2UiKTsKPj4+Pj4+Pj4+Pj4+Pj4+ICNlbHNlCj4+
Pj4+Pj4+Pj4+Pj4+PiAtIC8qIEVuY29kaW5nIG9mIHRoZSBwYXVzZSBpbnN0cnVjdGlvbiAqLwo+
Pj4+Pj4+Pj4+Pj4+Pj4gLSBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoIi40Ynl0ZSAweDEwMDAwMEYi
KTsKPj4+Pj4+Pj4+Pj4+Pj4+ICsgLyogRW5jb2Rpbmcgb2YgdGhlIHBhdXNlIGluc3RydWN0aW9u
ICovCj4+Pj4+Pj4+Pj4+Pj4+PiArIF9fYXNtX18gX192b2xhdGlsZV9fICgiLjRieXRlIDB4MTAw
MDAwRiIpOwo+Pj4+Pj4+Pj4+Pj4+Pj4gI2VuZGlmCj4+Pj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+
Pj4+PiBobW0sIHRob3VnaCBiZWZvcmUgdGhpcyBwYXJ0IG9mIHRoZSBjb2RlIHdhcyBvbmx5IGV2
ZXIgYWNjZXNzZWQKPj4+Pj4+Pj4+Pj4+Pj4gd2hlbiB0aGUgemhpbnRwYXVzZSBleHRlbnNpb24g
d2FzIHJlYWxseSBhdmFpbGFibGUgb24gdGhlIHJ1bm5pbmcKPj4+Pj4+Pj4+Pj4+Pj4gbWFjaGlu
ZSB3aGlsZSBub3cgdGhlIHBhdXNlIGluc3RydWN0aW9uIGlzIGNhbGxlZCBldmVyeSB0aW1lLgo+
Pj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4+Pj4gU28gSSdtIGp1c3Qgd29uZGVyaW5nLCBjYW4n
dCB0aGlzIHJ1biBpbnRvIHNvbWUgImlsbGVnYWwgaW5zdHJ1Y3Rpb24iCj4+Pj4+Pj4+Pj4+Pj4+
IHRoaW5neSBvbiBtYWNoaW5lcyBub3Qgc3VwcG9ydGluZyB0aGUgZXh0ZW5zaW9uPwo+Pj4+Pj4+
Pj4+Pj4+IAo+Pj4+Pj4+Pj4+Pj4+IE5vLiBUaGUgZW5jb2RpbmcgZm9yIHBhdXNlIHdhcyBkZWxp
YmVyYXRlbHkgY2hvc2VuIHRvIGJlIG9uZSBvZiB0aGUKPj4+Pj4+Pj4+Pj4+PiDigJx1c2VsZXNz
4oCdIGVuY29kaW5ncyBvZiBmZW5jZSwgd2l0aCB0aGUgaG9wZSB0aGF0IGV4aXN0aW5nCj4+Pj4+
Pj4+Pj4+Pj4gbWljcm9hcmNoaXRlY3R1cmVzIG1pZ2h0IHRha2UgYSB3aGlsZSB0byBleGVjdXRl
IGl0IGFuZCB0aHVzIGl0IHdvdWxkCj4+Pj4+Pj4+Pj4+Pj4gc3RpbGwgZnVuY3Rpb24gYXMgYSBz
bG93LXJ1bm5pbmcgaW5zdHJ1Y3Rpb24uIEl04oCZcyBzb21ld2hhdAo+Pj4+Pj4+Pj4+Pj4+IHF1
ZXN0aW9uYWJsZSB3aGV0aGVyIHRoZSBkaXYgaXMgZXZlbiBuZWVkZWQsIHRoZSB3b3JzdCB0aGF0
IGhhcHBlbnMgaXMKPj4+Pj4+Pj4+Pj4+PiBjcHVfcmVsYXggaXNu4oCZdCB2ZXJ5IHJlbGF4ZWQg
YW5kIHlvdSBzcGluIGEgYml0IGZhc3Rlci4gQW55Cj4+Pj4+Pj4+Pj4+Pj4gaW1wbGVtZW50YXRp
b25zIHdoZXJlIHRoYXTigJlzIHRydWUgcHJvYmFibHkgYWxzbyBkb27igJl0IGhhdmUgZmFuY3kK
Pj4+Pj4+Pj4+Pj4+PiBjbG9jay9wb3dlciBtYW5hZ2VtZW50IGFueXdheSwgYW5kIGRpdiBpc27i
gJl0IGdvaW5nIHRvIGJlIGEgbG93LXBvd2VyCj4+Pj4+Pj4+Pj4+Pj4gb3BlcmF0aW9uIHNvIHRo
ZSBvbmx5IHJlYWwgZWZmZWN0IGlzIGxpa2VseSBoYW1tZXJpbmcgb24gY29udGVuZGVkCj4+Pj4+
Pj4+Pj4+Pj4gYXRvbWljcyBhIGJpdCBtb3JlLCBhbmQgd2hvIGNhcmVzIGFib3V0IHRoYXQgb24g
dGhlIGxvdyBjb3JlIGNvdW50Cj4+Pj4+Pj4+Pj4+Pj4gc3lzdGVtcyB3ZSBoYXZlIHRvZGF5Lgo+
Pj4+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+PiB0aGFua3MgYSBsb3QgZm9yIHRoYXQgZXhwbGFuYXRp
b24sIHdoaWNoIG1hZGUgdGhpbmdzIGEgbG90IGNsZWFyZXIuCj4+Pj4+Pj4+Pj4+PiAKPj4+Pj4+
Pj4+Pj4+IFNvIGFzIHlvdSBzYWlkLCBkcm9wcGluZyB0aGUgZGl2IHBhcnQgbWlnaHQgbWFrZSB0
aGUgZnVuY3Rpb24gZXZlbiBzbWFsbGVyLAo+Pj4+Pj4+Pj4+Pj4gdGhvdWdoIHNvbWVob3cgcGFy
dCBvZiBtZSB3b3VsZCB3YW50IHRvIGFkZCBzb21lIHNvcnQgb2YgY29tbWVudCB0bwo+Pj4+Pj4+
Pj4+Pj4gdGhlIGZ1bmN0aW9uIGZvciB3aGVuIHRoZSBuZXh0IGRldmVsb3BlciBzdHVtYmxlcyBv
dmVyIHRoZSB1bmNvbmRpdGlvbmFsCj4+Pj4+Pj4+Pj4+PiB1c2Ugb2YgcGF1c2UgOi0pIC4KPj4+
Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4gSSBhZ3JlZS4gSWYgdGhhdCdzIHdo
YXQgbWljcm9hcmNoIHdpbGwgZG8sIHdlIGNhbiBkcm9wIGRpdiBhbHRvZ2V0aGVyLgo+Pj4+Pj4+
Pj4+PiBUaG91Z2ggbWljcm9hcmNoIG1heSBiZSB0cmVhdGVkIGFzIG5vcCBldmVuIGlmIGl0IGlz
IHVuZGVzaXJhYmxlLgo+Pj4+Pj4+Pj4+PiBJSVJDLCB0aGUgZGl2IHdhcyBpbnRyb2R1Y2VkIGZv
ciB0aGUgcm9ja2V0IGNoaXAgd2hpY2ggd291bGQgaW5kdWNlIGEKPj4+Pj4+Pj4+Pj4gbG9uZyBs
YXRlbmN5IHN0YWxsIHdpdGggZGl2IGluc3RydWN0aW9uICh6ZXJvIGFzIG9wZXJhbmRzKS4KPj4+
Pj4+Pj4+Pj4gCj4+Pj4+Pj4+Pj4+IERvZXMgYW55IG90aGVyIGNvcmUgb3IgbmV3ZXIgcm9ja2V0
IGNoaXAgYWN0dWFsbHkgaW5kdWNlIGEgbGF0ZW5jeQo+Pj4+Pj4+Pj4+PiBzdGFsbCB3aXRoIGRp
diBpbnN0cnVjdGlvbiA/Cj4+Pj4+Pj4+Pj4+IElmIG5vdCwgaXQgaXMgZXF1aXZhbGVudCB0byBO
T1AgYXMgd2VsbC4gV2UgY2FuIGRlZmluaXRlbHkgcmVtb3ZlIHRoZSBkaXYuCj4+Pj4+Pj4+Pj4+
IFRoZSBvbmx5IGNvcmVzIGFmZmVjdGVkIHdpbGwgYmUgdGhlIG9sZGVyIHJvY2tldCBjb3JlLgo+
Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4gVGFnZ2luZyBzb21lIGZvbGtzIHRvIHVuZGVyc3RhbmQg
d2hhdCB0aGVpciBjb3JlIGRvZXMuCj4+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+PiBAUGF1bCBXYWxt
c2xleSBAR3VvIFJlbiBAQ29ub3IgRG9vbGV5ID8KPj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+PiBJIGFt
IG5vIG1pY3JvYXJjaCBleHBlcnQgYnkgX2FueV8gc3RyZXRjaCBvZiB0aGUgaW1hZ2luYXRpb24s
IGJ1dAo+Pj4+Pj4+Pj4+IGZyb20gYSBxdWljayBleHBlcmltZW50IGl0IGxvb2tzIGxpa2UgdGhl
IHU1NHMgb24gUG9sYXJGaXJlIFNvQyBiZWhhdmUKPj4+Pj4+Pj4+PiBpbiB0aGUgc2FtZSB3YXks
IGFuZCBkaXYgdy8gemVybyBvcGVyYW5kcyBkb2VzIGluIGZhY3QgdGFrZSBzaWduaWZpY2FudGx5
Cj4+Pj4+Pj4+Pj4gbG9uZ2VyIHRoYW4gcmVndWxhciBkaXZpc2lvbiAobG9va3MgdG8gYmUgYWJv
dXQgM3gpLgo+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+PiBUaGFua3MuIERvIHlvdSBo
YXZlIGFueSBkYXRhIG9uIGhvdyBtdWNoIHRoZSAicGF1c2UiIGluc3RydWN0aW9uIHRha2VzLgo+
Pj4+Pj4+PiAKPj4+Pj4+Pj4gU28gdGhlc2UgbnVtYmVycyB5b3UgbWF5IGNvbnNpZGVyIGFzIGJl
aW5nIHB1bGxlZCBvdXQgb2YgYSBtYWdpYyBoYXQKPj4+Pj4+Pj4gYXMgYWxsIEkgYW0gZG9pbmcg
aXMgcmVhZGluZyB0aGUgY291bnRlcnMgZnJvbSB1c2Vyc3BhY2UgYW5kIHRoZXJlIGlzCj4+Pj4+
Pj4+IHNvbWUgdmFyaWFuY2UgZXRjLiBQbHVzIHRoZSBmYWN0IHRoYXQgSSBqdXN0IHN0YXJ0ZWQg
aGFja2luZyBhdCBzb21lCj4+Pj4+Pj4+IGV4aXN0aW5nIGNvZGUgSSBoYWQgbHlpbmcgYXJvdW5k
IGFzIEknbSBwcmV0dHkgc25vd2VkIHVuZGVyIGF0IHRoZQo+Pj4+Pj4+PiBtb21lbnQuCj4+Pj4+
Pj4+IAo+Pj4+Pj4+PiBEb2luZyB0aGUgZm9sbG93aW5nIHRha2VzIGFib3V0IDcwIGN5Y2xlcyBv
biBib3RoIGEgUG9sYXJGaXJlIFNvQyBhbmQgYW4KPj4+Pj4+Pj4gdW5tYXRjaGVkOgo+Pj4+Pj4+
PiBsb25nIGRpdmlzb3IgPSAyLCBkaXZpZGVuZCA9IDEwMDAwMCwgZGVzdDsKPj4+Pj4+Pj4gYXNt
KCJkaXYgJTAsIHplcm8sIHplcm8iIDogIj1yIiAoZGVzdCkpOwo+Pj4+Pj4+PiBhbmQgZXF1YXRl
cyB0bzoKPj4+Pj4+Pj4gc2QgYTUsLTQ4KHMwKQo+Pj4+Pj4+PiBkaXYgYTUsemVybyx6ZXJvCj4+
Pj4+Pj4+IAo+Pj4+Pj4+PiBDbG9ja2luZyBpbiBhdCBhYm91dCA0MCBjeWNsZXMgaXMgc29tZSBh
Y3R1YWwgZGl2aXNpb25zLCBJIGp1c3QgZGlkIHRoZQo+Pj4+Pj4+PiBmb2xsb3dpbmcgYSBkb3pl
biB0aW1lcywgZG9pbmcgYSB0cml2aWFsIGNvbXB1dGF0aW9uOgo+Pj4+Pj4+PiBsb25nIGRpdmlz
b3IgPSAyLCBkaXZpZGVuZCA9IDEwMDAwMCwgZGVzdDsKPj4+Pj4+Pj4gYXNtKCJkaXYgJTAsICUx
LCAlMiIgOiAiPXIiIChkaXZpZGVuZCkgOiAiciIgKGRpdmlkZW5kKSwgInIiIChkaXZpc29yKSkK
Pj4+Pj4+Pj4gCj4+Pj4+Pj4+IGllLCBhIGxvYWQgb2YgdGhlIGZvbGxvd2luZzoKPj4+Pj4+Pj4g
c2QgYTUsLTQ4KHMwKQo+Pj4+Pj4+PiBsZCBhNSwtNDgoczApCj4+Pj4+Pj4+IGxkIGE0LC00MChz
MCkKPj4+Pj4+Pj4gZGl2IGE1LGE1LGE0Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBTbyBjbGVhcmx5IHRo
ZSBkaXYgdy8gemVybyBhcmdzIG1ha2VzIGEgZGlmZmVyZW5jZS4uLgo+Pj4+Pj4+PiAKPj4+Pj4+
Pj4gT24gUG9sYXJGaXJlIFNvQywgYDB4MTAwMDAwRmAgdGFrZXMgYXBwcm94IDYgY3ljbGVzLiBP
biBteSB1bm1hdGNoZWQsIGl0Cj4+Pj4+Pj4+IHRha2VzIGFwcHJveCA0MC4gQWdhaW4sIEkganVz
dCBoYWQgYW4gYXNtIGJsb2NrICYgY2FsbGVkIHRoZSBpbnN0cnVjdGlvbgo+Pj4+Pj4+PiBhIG51
bWJlciB0aW1lcyBhbmQgdG9vayB0aGUgYXZlcmFnZSAtIGhlcmUgaXQgd2FzIDQ4IHRpbWVzLgo+
Pj4+Pj4+PiAKPj4+Pj4+Pj4gVGFrZSB0aGUgYWN0dWFsIG51bWJlcnMgd2l0aCBhIGZpc3QgZnVs
bCBvZiBzYWx0LCBidXQgYXQgbGVhc3QgdGhlCj4+Pj4+Pj4+IHJlbGF0aXZlIG51bWJlcnMgc2hv
dWxkIGJlIG9mIHNvbWUgdXNlIHRvIHlvdS4KPj4+Pj4+Pj4gCj4+Pj4+Pj4+IEhvcGUgdGhhdCdz
IHNvbWV3aGF0IGhlbHBmdWwsIG1heWJlIG5leHQgd2VlayBJIGNhbiBkbyBzb21ldGhpbmcgYQo+
Pj4+Pj4+PiBsaXR0bGUgbW9yZSB1c2VmdWwgZm9yIHlvdS4uLgo+Pj4+Pj4+PiAKPj4+Pj4+PiAK
Pj4+Pj4+PiBUaGFua3MuIEl0IHdvdWxkIGJlIGdvb2QgdG8gdW5kZXJzdGFuZCB3aGF0IGhhcHBl
bnMgd2hlbiAicGF1c2UiIGlzCj4+Pj4+Pj4gZXhlY3V0ZWQgb24gdGhlc2UgYm9hcmRzID8KPj4+
Pj4+IAo+Pj4+Pj4gVGhlIGFjdHVhbCBwYXVzZSBpbnN0cnVjdGlvbj8gdWhoLCBzbyB3aXRoIHRo
ZSB1c3VhbCAiSSBkb24ndCBrbm93IHdoYXQKPj4+Pj4+IEkgYW0gZG9pbmciIGRpc2NsYWltZXIs
IEkgcmFuIGVhY2ggb2YgdGhlIC5pbnNuIGFuZCBwYXVzZSBpbnN0cnVjdGlvbiA0OAo+Pj4+Pj4g
dGltZXMgaW4gYSByb3cgYW5kIGNoZWNrZWQgdGhlIHRpbWUgZWxhcHNlZCB2aWEgcmRjeWNsZSAm
IHRoZW4gcmFuIHRoYXQKPj4+Pj4+IGMgcHJvZ3JhbSAxMDAwIHRpbWVzIGluIGEgYmFzaCBsb29w
LiBHb3QgdGhlIGJlbG93LCB0aGUgaW5zbnMgd2VyZSBydW4KPj4+Pj4+IGZpcnN0IGFuZCB0aGVu
IHRoZSBwYXVzZXMuCj4+Pj4+PiBpbnNuIHBhdXNlCj4+Pj4+PiBtaW4gMi4zIDMuMgo+Pj4+Pj4g
bWF4IDkuNSAxMC42Cj4+Pj4+PiBhdmcgMjcuMCAyOS4xCj4+Pj4+PiA1JSAyLjkgNC4yCj4+Pj4+
PiA5NSUgMTguMSAxOS4xCj4+Pj4+PiAKPj4+Pj4+IFN3YXBwaW5nIHRoZSBwYXVzZSAmIGluc24g
b3JkZXIgYXJvdW5kIG1hZGUgYSBtaW5vciBkaWZmZXJlbmNlLCBidXQgbm90Cj4+Pj4+PiBlbm91
Z2ggdG8gcmVwb3J0IG9uLiBJJ2QgYmUgdmVyeSB3YXJ5IG9mIGRyYXdpbmcgYW55IHJlYWwgY29u
Y2x1c2lvbnMKPj4+Pj4+IGZyb20gdGhpcyBkYXRhLCBidXQgYXQgbGVhc3QgYm90aCBhcmUgcm91
Z2hseSBzaW1pbGFyIChhbmQgY2VydGFpbmx5IG5vdAo+Pj4+Pj4gZXZlbiBjbG9zZSB0byBkb2lu
ZyB0aGUgZGl2IHcvIHplcm8gYXJncy4KPj4+Pj4+IAo+Pj4+PiAKPj4+Pj4gWWVhaC4gVGhhdCdz
IHdoYXQgSSB3YXMgZXhwZWN0aW5nLiBTbyB3ZSBjYW4ndCBkcm9wIHRoZSBkaXYgZm9yIG5vdy4g
T3RoZXJ3aXNlLAo+Pj4+PiB0aGUgZXhpc3RpbmcgaGFyZHdhcmUoZG9uJ3Qgc3VwcG9ydCBaaGlu
dHBhdXNlKSBzdWZmZXJzIGJ5IHNwaW5uaW5nIGZhc3Rlci4KPj4+PiAKPj4+PiBCdXQgZG9lcyB0
aGF0IGFjdHVhbGx5IG1hdHRlciBpbiBwcmFjdGljZT8gSWYgaXQgZG9lc27igJl0IG5vdGljZWFi
bGUKPj4+PiBhZmZlY3QgcGVyZm9ybWFuY2UgdGhlbiB5b3UgZG9u4oCZdCBuZWVkIHRvIGtlZXAg
dGhlIGRpdi4gVGhlcmUgYXJlIGEgbG90Cj4+Pj4gb2YgYXJjaGl0ZWN0dXJlcyB0aGF0IGV2ZW4g
anVzdCBkZWZpbmUgY3B1X3JlbGF4KCkgYXMgYmFycmllcigpLgo+Pj4gRGl2IGlzIG5vdCBzZW1h
bnRpYyBhY2N1cmF0ZSBmb3Igc3RhbmRhcmQgY29kZSwgaXQgc2hvdWxkIGJlIGluCj4+PiB2ZW5k
b3JzJyBlcnJhdGEuIEkgYWdyZWUgdG8gbGVhdmUgbm9wIGFzIGRlZmF1bHQgYW5kIHB1dCBhIHBh
dXNlCj4+PiBpbnN0ZWFkIGFmdGVyIHRoZSBmZWF0dXJlIGlzIGRldGVjdGVkLgo+PiAKPj4gTm9i
b2R54oCZcyBzdWdnZXN0aW5nIGEgbGl0ZXJhbCBub3AgaW5zdHJ1Y3Rpb24sIHRoYXQgd291bGQg
YmUgd29yc2UgdGhhbgo+PiBlaXRoZXIgZGl2IG9yIHBhdXNlLiBJdOKAmXMgYWx3YXlzIHNhZmUg
dG8gZXhlY3V0ZSBwYXVzZSwgdGhlIHF1ZXN0aW9uIGlzCj4+IGp1c3Qgd2hldGhlciBvbiBleGlz
dGluZyBzeXN0ZW1zIHRoYXQgZG9u4oCZdCBpbXBsZW1lbnQgWmloaW50cGF1c2UgaXQKPj4gZ2V0
cyBleGVjdXRlZCB0b28gcXVpY2tseSBzdWNoIHRoYXQgcGVyZm9ybWFuY2UgaXMgZGVncmFkZWQg
ZHVlIHRvCj4+IHNwaW5uaW5nIG1vcmUgYWdncmVzc2l2ZWx5Lgo+IAo+IFdoeSBkbyB5b3UgZW5z
dXJlIHBhdXNlIGNhbid0IGJlIGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gaW4gc29tZSBvbGQgbWFj
aGluZT8KCkJlY2F1c2UgdGhhdOKAmXMgaG93IGl04oCZcyBkZWZpbmVkOyBpdCB1c2VzIG9uZSBv
ZiB0aGUgbWFueSBoaW50cwooaW5zdHJ1Y3Rpb25zIHRoYXQgYXJlbuKAmXQgYSBjYW5vbmljYWwg
bm9wIGJ1dCBhcmUgZGVmaW5lZCB0byBiZWhhdmUKbGlrZSBvbmUgaW4gdGVybXMgb2YgYXJjaGl0
ZWN0dXJhbCBzaWRlLWVmZmVjdHMpIGZyb20gUlYzMkkvUlY2NEkuCgo+IFdoeSBkbyB5b3UgZW5z
dXJlIGRpdiBjb3VsZCBzYXZlIHBvd2VyIGZvciBhbGwgbWljcm9hcmNoaXRlY3R1cmVzPwoKSSBk
b27igJl0LiBJbiBmYWN0IGl0IGFsbW9zdCBjZXJ0YWlubHkgd29u4oCZdCBtYWtlIHRoZSBjb3Jl
IGVudGVyIGEgbG93CnBvd2VyIHN0YXRlLiBJdCB3aWxsIGp1c3QgaGVscCByZWR1Y2UgdGhlIGFt
b3VudCBvZiBtZW1vcnkgdHJhZmZpYyBieQp0YWtpbmcgYSB3aGlsZSB0byBleGVjdXRlLiBJIHdv
dWxkIHJhdGhlciBub3QgdXNlIGRpdiBhdCBhbGwuCgpKZXNzCgo+IG5vcCAoZGVmYXVsdCkgLT4g
ZGl2LzxvdGhlciBpbnN0cnVjdGlvbnM+IChtb3ZlZCBpbnRvIHZlbmRvciBlcnJhdGEpCj4gLT4g
cGF1c2UgKHdoZW4gWmlIaW50UGF1c2UgZmVhdHVyZSBkZXRlY3RlZCkKPiAKPj4gCj4+IEplc3MK
Pj4gCj4+Pj4gCj4+Pj4gSmVzcwo+Pj4+IAo+Pj4+PiBUaGFua3MgZm9yIHJ1bm5pbmcgdGhlIGV4
cGVyaW1lbnRzLgo+Pj4+PiAKPj4+Pj4+IEFnYWluLCBob3BlIHRoYXQgaXMgaGVscGZ1bD8KPj4+
Pj4+IENvbm9yLgo+Pj4+Pj4gCj4+Pj4+Pj4gCj4+Pj4+Pj4+IENvbm9yLgo+Pj4+Pj4+PiAKPj4+
Pj4+Pj4+IEkgdW5kZXJzdGFuZCB0aGF0IGl0IGlzIG5vdCBhdmFpbGFibGUgaW4gdGhlc2UgY29y
ZXMuIEp1c3Qgd2FudGVkIHRvCj4+Pj4+Pj4+PiB1bmRlcnN0YW5kIGlmIG1pY3JvYXJjaGl0ZWN0
dXJlCj4+Pj4+Pj4+PiBhY3R1YWxseSB0YWtlcyBhIHdoaWxlIGV4ZWN1dGluZyB0aGUgdXNlbGVz
cyBlbmNvZGluZyBhcyBwb2ludGVkIG91dCBieSBKZXNzaWNhLgo+Pj4+Pj4+Pj4gCj4+Pj4+Pj4+
PiBJZiB0aGF0J3MgdGhlIGNhc2UsIHdlIGNhbiByZW1vdmUgdGhlIGRpdiBpbnN0cnVjdGlvbiBh
bHRvZ2V0aGVyLgo+Pj4+Pj4+Pj4gT3RoZXJ3aXNlLCB0aGlzIHBhdGNoIHdpbGwgY2F1c2Ugc29t
ZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uCj4+Pj4+Pj4+PiBmb3IgZXhpc3RpbmcgU29DIChIaUZp
dmUgdW5sZWFzaGVkIGhhcyB0aGUgc2FtZSBjb3JlLiBOb3Qgc3VyZSBhYm91dAo+Pj4+Pj4+Pj4g
dW5tYXRjaGVkIHRob3VnaCkuCj4+Pj4+Pj4+PiBUaGlzIG5lZWRzIHRvIGJlIGRvY3VtZW50ZWQg
YXQgbGVhc3QuCj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+PiBIb3BlIHRoYXQncyBoZWxwZnVsLAo+Pj4+
Pj4+Pj4+IENvbm9yLgo+Pj4+Pj4+Pj4+IAo+Pj4+Pj4+Pj4+IChJIGp1c3QgZGlkIGEgcXVpY2sg
Y2hlY2sgb2Ygd2hhdCBwcmV0dHkgbXVjaCBhbW91bnRlZCB0byBhIGJ1bmNoIG9mCj4+Pj4+Pj4+
Pj4gZGl2IGE1LHplcm8semVybyBpbiBhIHJvdyB2ZXJzdXMgZGl2IGE1LGE1LGE1KQo+Pj4+Pj4+
Pj4+IAo+Pj4+Pj4+Pj4+PiAKPj4+Pj4+Pj4+Pj4gKFBsZWFzZSBhZGQgYW55Ym9keSB3aG8gbWF5
IGhhdmUgYW4gaW5zaWdodCB0byBleGVjdXRpb24gZmxvdyBvbgo+Pj4+Pj4+Pj4+PiBleGlzdGlu
ZyBMaW51eCBjYXBhYmxlIGNvcmVzKQo+Pj4+Pj4+Pj4+PiAKPj4+Pj4+IAo+Pj4+PiAKPj4+Pj4g
Cj4+Pj4+IC0tCj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+IEF0aXNoCj4+Pj4gCj4+PiAKPj4+IAo+Pj4g
LS0KPj4+IEJlc3QgUmVnYXJkcwo+Pj4gR3VvIFJlbgo+PiAKPiAKPiAKPiAtLSAKPiBCZXN0IFJl
Z2FyZHMKPiBHdW8gUmVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
