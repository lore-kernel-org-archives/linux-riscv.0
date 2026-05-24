Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33953CD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 05:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj9+/mnL0sp3Wsq1F2uB7CURTWQVHGYql8bIRAbyOXg=; b=iWG7wnYbNxcT5M
	xJiUgvvEtWdE0aLS93Yh76Dim3SJcX0epKFY2NyD+0na5XELO7hFG1B8amwnR+IeqV+a1Q3OdxJ0z
	9AJ3CjrQ1qBa/iEgA4vEB7AAXFsCkD1nAmcUJsUK84IbIWZa4k3MutBANcRouFdVwaqR7BkIcKyG6
	8H6s7nUlE9Z2VVuliJEF10gTQ+WNFCRGuwXceeQtpOncoHimFCPLee2LJ0OstYt6TVgEY4I3seLRs
	y5SA8TRgtZ6o1ayHaZ4PtBTu6Njd25apGGIF6cXXSJK8E3UW3zO1qJw056K0onhBLO/gTLrEc+qDm
	eWgmAtrUMRU/zUp0Sorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1KY-0000000EUTu-3hyr;
	Sun, 24 May 2026 05:24:54 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1KW-0000000EUSr-2zeU
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 05:24:54 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e61d8d9a21so385677a34.0
        for <linux-riscv@lists.infradead.org>; Sat, 23 May 2026 22:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779600291; cv=none;
        d=google.com; s=arc-20240605;
        b=Xni+US1XlqHDN631n26LDqCDYD64vaRhmkWgBYYcZPAGIhrh5INCKXaFTrea85tPqK
         RLxiX/2j6zetyWJGvLZbwmzctXjT3VpYvS3qpgE6hIpmF/GJN0oXw464hWdLitXqxiq2
         wxGUpAYw7e+3nQV3ju2bEeHQ75LKB7LEv6GeQGPfofAl38GZY3GihF6G00N8kSrowHrN
         B3ceLY2cl5IHPlmWMeFDfD6oRwEN9y+Pg/ppqyf5y5iDspgx03dcRaEHx1mLH+fbggf4
         YJQ4wNDBeOI6QZQZ6OTViYI1RQrYQvUNcSVyBXmomCGqISxoBIEglpCiZG7ryjdc69hw
         W27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IbupSW0UagmshubFRiSQA618qybyRttziXYFiFa+ZEM=;
        fh=XRzmROupJKR5MWKgZR+fEq3/SsxApS/y5nt5w8wiwvY=;
        b=JBTCTxo3Dgyq+NToo65tiHr1wAuPygsb9d1DnuWjZFR5VpMY9emvCXK6xI5VbJ+oYU
         zarbrcz1ZtKgKvTJmAf8LmyN5IoBD4EVUuzR4MT2+PqeRSEx4gpuovzLlRjzdeeFIohz
         niUOoP9+amRNhUNT0/qGPIODiI7DbWb8WIF/cLGWSpez24UwQA6atBYnSzbFYVG35k1n
         WQQgRuTDp3OhI3qcWjyqbghFvnWshzXVQUw8AqfvpnfuFFKzmQDbjt+GeZb2sB1PHzne
         G0kJ2GuaxmWpNyg1togy2Y75957BziwgLuh1Rxo2k3FuaBT4kC4pKuNLVVknxiLQd85N
         bspA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779600291; x=1780205091; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbupSW0UagmshubFRiSQA618qybyRttziXYFiFa+ZEM=;
        b=ulbtWvB7WNcLJweoLV5lBrjy7cW+XFzJRufleiJ42aDJTk3f8FkuCacJY6ZpRYuMYd
         aQvbloBwnUoWCFa2yT9HOVqYhp5ejw3L7r/cVwAAkIzNyWizNVYyN4cC3KmxEBvCxDr5
         rXfDqbqELkOr6P9fXm5k797/J2tsBq90+i9V8R4QLYplcodgghhcGTBUgpHzbdmdWNQJ
         YBaLUrvItuoHYbNsFuBgBwFOLxaeHgnQsdmDJwR8BK2V8YhQEf/emmj4kkStt7h05Zgf
         48h0FI3ZvzLBx7LrlOc2Z4pQHFaECRiySgKkSjOMK0b9QZg65IDBSLmtLyf912KGXI/h
         YrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779600291; x=1780205091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbupSW0UagmshubFRiSQA618qybyRttziXYFiFa+ZEM=;
        b=FtfmeXfk+Itw6rxlmI089PqekHElAYv5bF3X3KC/ZR+XQNRaU4buhfXyCAbzlWTKk+
         huU2IaS6kgpP9eOQy+BiGgUQ/hEuKhGCsw+z9P36Hfzw912jMcLRSoM3DinNVYpBx+NS
         Re8mPKm/sYGjBvQdIES9TEisaDpDLGOMpgxSHVloyaMNdIFP3GWFvHitbZKUkXmugikY
         uGxvT2jn4ltgklv15scBJ4O7FuyGm3Y9bD5X6WrmXr4X+tFMCL4txqGXoaLK5bUl2jyU
         PNQXr2+d9zrsiCLxb+DWNK9f74kL/1cQgK8LwOwdzC7TThk3n979HPo4CSRDiSqIL0G6
         J5DA==
X-Forwarded-Encrypted: i=1; AFNElJ9tfA1Y2oM8fcP++lufiLxNrMl4l+c4idd+PbX55m8qVfn3nqNAM22twgf+3hWlRgHlnanlyjFChdklCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUgJWQqM1qTgi0LfSgnOLUyZvnIvAy2xyOIDKu7qWzv2dXw+cZ
	7okF1LI45zt/gtWLSntSlLOiUpJcqD93FjGYYYgo8n2sLN4NkRBq6AyH6YdzgQ0AvUyxp3EJtca
	walTmohqLtXqFlFLa4G2PBUOQLN1SNYEJ2LyduMdU1Q==
X-Gm-Gg: Acq92OHfuY4qov7zLc70yBZqK6ImRuaH4PzErrRxUWKPtcntlwD+fz3u0dJRPTnGF1M
	Pooqlf/BKi7xFrGmqy/U1+pGAoHS9JaIkOCzBqLmveImvd5DVKwW5Y5vehuzBlwItEFcWJ31BrW
	q0fgxhZGpw1wHQL5juay5UrJlF4mbzKF0ULO9nNtPWsJ3qwiWV3VrxXha1qf4bbWEdpZjmf34pt
	qgofhRQTwMq9+7BMNA8itMO2TPglNqCuozNMuDYzBoJ1/ncyPBgRb8r5eofXZ9ciijN2GjXlDSc
	oIQvteVEI+GEmMN14RoUJL63vMB9+joWTI6L9ERr0EUUGF/FmBQeZKCXRsrjkQXovxVgtz+zCzc
	MV+9Hs5VOLZPAQUR1iY+YU+tCD6682xoEwkGftA==
X-Received: by 2002:a05:6820:868b:b0:69b:5f97:de79 with SMTP id
 006d021491bc7-69d7eb91b64mr4064097eaf.19.1779600291542; Sat, 23 May 2026
 22:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-3-guoren@kernel.org>
In-Reply-To: <20260425005916.3321811-3-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 May 2026 10:54:39 +0530
X-Gm-Features: AVHnY4KihubV0U34tSm4W-TTo3A-ChHfjM74JnkAvA8gb0S55cVQRZv-mcQkpfE
Message-ID: <CAAhSdy1pDsRZGorxU9bJ7cs19v3LH40hhoaYvWQUsFo-z_Fjmw@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] RISC-V: KVM: AIA: Replace global HGEI count with
 simple enabled bool
To: guoren@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, gaohan@iscas.ac.cn, 
	inochiama@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, me@ziyao.cc, 
	palmer@dabbelt.com, pjw@kernel.org, tglx@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_222452_765166_10377020 
X-CRM114-Status: GOOD (  22.03  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgNjoyOeKAr0FNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBOb3cgdGhhdCBIR0VJIGxpbmUgbWFuYWdlbWVudCBpcyBmdWxseSBwZXIt
Q1BVICh2aWEgc3RydWN0Cj4gYWlhX2hnZWlfY29udHJvbDo6bnJfaGdlaSksIHRoZSBnbG9iYWwg
YGt2bV9yaXNjdl9haWFfbnJfaGdlaWAKPiBpcyBubyBsb25nZXIgbmVlZGVkLiBSZXBsYWNlIGl0
IHdpdGggYSBzaW1wbGUgYGJvb2wKPiBrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZGAgdGhhdCBv
bmx5IGluZGljYXRlcyB3aGV0aGVyIEhHRUkKPiBzdXBwb3J0IGlzIGF2YWlsYWJsZSBhdCBhbGwu
CgpBcyBtZW50aW9uZWQgaW4gUEFUQ0gxLCB0aGlzIFBBVENIIGlzIG5vdCByZXF1aXJlZC4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBr
ZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCB8ICAy
ICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgIHwgMTggKysrKysrKystLS0t
LS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyAgICAgIHwgIDQgKystLQo+ICBh
cmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICB8ICAzICstLQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fYWlhLmgKPiBpbmRleCBiMDRlY2RkMWE4NjAuLmU4NzQ5YWM2YmVkNyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX2FpYS5oCj4gQEAgLTc5LDcgKzc5LDcgQEAgc3RydWN0IGt2bV92Y3B1X2Fp
YSB7Cj4KPiAgI2RlZmluZSBpcnFjaGlwX2luX2tlcm5lbChrKSAgICAgICAgICAgKChrKS0+YXJj
aC5haWEuaW5fa2VybmVsKQo+Cj4gLWV4dGVybiB1bnNpZ25lZCBpbnQga3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpOwo+ICtleHRlcm4gYm9vbCBrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZDsKPiAgZXh0
ZXJuIHVuc2lnbmVkIGludCBrdm1fcmlzY3ZfYWlhX21heF9pZHM7Cj4gIERFQ0xBUkVfU1RBVElD
X0tFWV9GQUxTRShrdm1fcmlzY3ZfYWlhX2F2YWlsYWJsZSk7Cj4gICNkZWZpbmUga3ZtX3Jpc2N2
X2FpYV9hdmFpbGFibGUoKSBcCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jIGIv
YXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRleCBhMjM3MjkwNTJjZmIuLjcwZmYxZDI1ZGQ5OSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4gQEAgLTI4LDcgKzI4LDcgQEAgc3RydWN0IGFpYV9oZ2VpX2NvbnRyb2wgewo+ICBz
dGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGFpYV9oZ2VpX2NvbnRyb2wsIGFpYV9oZ2VpKTsK
PiAgc3RhdGljIGludCBoZ2VpX3BhcmVudF9pcnE7Cj4KPiAtdW5zaWduZWQgaW50IGt2bV9yaXNj
dl9haWFfbnJfaGdlaTsKPiArYm9vbCBrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZDsKPiAgdW5z
aWduZWQgaW50IGt2bV9yaXNjdl9haWFfbWF4X2lkczsKPiAgREVGSU5FX1NUQVRJQ19LRVlfRkFM
U0Uoa3ZtX3Jpc2N2X2FpYV9hdmFpbGFibGUpOwo+Cj4gQEAgLTQ5MSw3ICs0OTEsNyBAQCBzdGF0
aWMgaW50IGFpYV9oZ2VpX2luaXQodm9pZCkKPiAgICAgICAgIHN0cnVjdCBpcnFfZG9tYWluICpk
b21haW47Cj4KPiAgICAgICAgIC8qIFNraXAgU0dFSSBpbnRlcnJ1cHQgc2V0dXAgZm9yIHplcm8g
Z3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0cyAqLwo+IC0gICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlh
X25yX2hnZWkpCj4gKyAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfaGdlaV9lbmFibGVkKQo+ICAg
ICAgICAgICAgICAgICBnb3RvIHNraXBfc2dlaV9pbnRlcnJ1cHQ7Cj4KPiAgICAgICAgIC8qIEZp
bmQgSU5UQyBpcnEgZG9tYWluICovCj4gQEAgLTUyNCw3ICs1MjQsNyBAQCBzdGF0aWMgaW50IGFp
YV9oZ2VpX2luaXQodm9pZCkKPiAgc3RhdGljIHZvaWQgYWlhX2hnZWlfZXhpdCh2b2lkKQo+ICB7
Cj4gICAgICAgICAvKiBEbyBub3RoaW5nIGZvciB6ZXJvIGd1ZXN0IGV4dGVybmFsIGludGVycnVw
dHMgKi8KPiAtICAgICAgIGlmICgha3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpKQo+ICsgICAgICAgaWYg
KCFrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+
Cj4gICAgICAgICAvKiBGcmVlIHBlci1DUFUgU0dFSSBpbnRlcnJ1cHQgKi8KPiBAQCAtNjMxLDYg
KzYzMSw3IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgaW50
IHJjOwo+ICAgICAgICAgY29uc3Qgc3RydWN0IGltc2ljX2dsb2JhbF9jb25maWcgKmdjOwo+ICsg
ICAgICAgdW5zaWduZWQgaW50IGt2bV9yaXNjdl9haWFfbnJfaGdlaTsKPgo+ICAgICAgICAgaWYg
KCFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBTeEFJQSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PREVWOwo+IEBAIC02NDEsMjEgKzY0MiwxOCBAQCBpbnQga3ZtX3Jp
c2N2X2FpYV9pbml0KHZvaWQpCj4gICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkgPSBmbHNf
bG9uZyhjc3JfcmVhZChDU1JfSEdFSUUpKTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfSEdFSUUs
IDApOwo+ICAgICAgICAgaWYgKGt2bV9yaXNjdl9haWFfbnJfaGdlaSkKPiAtICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpLS07Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9h
aWFfaGdlaV9lbmFibGVkID0gdHJ1ZTsKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIE51bWJl
ciBvZiB1c2FibGUgSEdFSSBsaW5lcyBzaG91bGQgYmUgbWluaW11bSBvZiBwZXItSEFSVAo+ICAg
ICAgICAgICogSU1TSUMgZ3Vlc3QgZmlsZXMgYW5kIG51bWJlciBvZiBiaXRzIGluIEhHRUlFCj4g
ICAgICAgICAgKi8KPiAtICAgICAgIGlmIChnYykKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X2FpYV9ucl9oZ2VpID0gbWluKCh1bG9uZylrdm1fcmlzY3ZfYWlhX25yX2hnZWksCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnYy0+bnJfZ3Vlc3RfZmlsZXMp
Owo+IC0gICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkg
PSAwOwo+ICsgICAgICAgaWYgKCFnYykKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9o
Z2VpX2VuYWJsZWQgPSAwOwo+Cj4gICAgICAgICAvKiBGaW5kIG51bWJlciBvZiBndWVzdCBNU0kg
SURzICovCj4gICAgICAgICBrdm1fcmlzY3ZfYWlhX21heF9pZHMgPSBJTVNJQ19NQVhfSUQ7Cj4g
LSAgICAgICBpZiAoZ2MgJiYga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpKQo+ICsgICAgICAgaWYgKGdj
ICYmIGt2bV9yaXNjdl9haWFfaGdlaV9lbmFibGVkKQo+ICAgICAgICAgICAgICAgICBrdm1fcmlz
Y3ZfYWlhX21heF9pZHMgPSBnYy0+bnJfZ3Vlc3RfaWRzICsgMTsKPgo+ICAgICAgICAgLyogSW5p
dGlhbGl6ZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHQgbGluZSBtYW5hZ2VtZW50ICovCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IGluZGV4IDNkMWU4MWUyYTM2Yi4uNWI0NWIxMTE0NDI1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IEBAIC03MSw3ICs3MSw3IEBAIHN0YXRpYyBpbnQgYWlhX2NvbmZpZyhzdHJ1
Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqIGV4dGVybmFsIGludGVycnVwdHMgKGkuZS4gbm9uLXplcm8KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAqIFZTLWxldmVsIElNU0lDIHBhZ2VzKS4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlhX25yX2hnZWkpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfaGdlaV9lbmFibGVkKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGRlZmF1bHQ6Cj4gQEAgLTYyOCw3ICs2MjgsNyBAQCB2b2lkIGt2bV9yaXNjdl9haWFfaW5pdF92
bShzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICAgKi8KPgo+ICAgICAgICAgLyogSW5pdGlhbGl6
ZSBkZWZhdWx0IHZhbHVlcyBpbiBBSUEgZ2xvYmFsIGNvbnRleHQgKi8KPiAtICAgICAgIGFpYS0+
bW9kZSA9IChrdm1fcmlzY3ZfYWlhX25yX2hnZWkpID8KPiArICAgICAgIGFpYS0+bW9kZSA9IChr
dm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZCkgPwo+ICAgICAgICAgICAgICAgICBLVk1fREVWX1JJ
U0NWX0FJQV9NT0RFX0FVVE8gOiBLVk1fREVWX1JJU0NWX0FJQV9NT0RFX0VNVUw7Cj4gICAgICAg
ICBhaWEtPm5yX2lkcyA9IGt2bV9yaXNjdl9haWFfbWF4X2lkcyAtIDE7Cj4gICAgICAgICBhaWEt
Pm5yX3NvdXJjZXMgPSAwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9h
cmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBpbmRleCBjYjhhNjUyNzNjMWYuLmJjZmExMzlmNDg3MSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS9tYWluLmMKPiBAQCAtMTY5LDggKzE2OSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2t2
bV9pbml0KHZvaWQpCj4gICAgICAgICBrdm1faW5mbygiVk1JRCAlbGQgYml0cyBhdmFpbGFibGVc
biIsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9iaXRzKCkpOwo+Cj4gICAgICAgICBpZiAoa3ZtX3Jp
c2N2X2FpYV9hdmFpbGFibGUoKSkKPiAtICAgICAgICAgICAgICAga3ZtX2luZm8oIkFJQSBhdmFp
bGFibGUgd2l0aCAlZCBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHRzXG4iLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkpOwo+ICsgICAgICAgICAgICAgICBr
dm1faW5mbygiQUlBIGF2YWlsYWJsZSB3aXRoIGd1ZXN0IGV4dGVybmFsIGludGVycnVwdHNcbiIp
Owo+Cj4gICAgICAgICBrdm1fcmlzY3Zfc2V0dXBfdmVuZG9yX2ZlYXR1cmVzKCk7Cj4KPiAtLQo+
IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
