Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E56C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dE4d+TSk5It7eQpst7UWBxF9p5l5WaSjA3mXlk5taFg=; b=qaDw8zsCWGQqLp
	uryXyQFs6QpkkQMnj0LLKZCD7LJhbNxLjprQpE+HJc5JgaOdDc4VpFVEwft04YujWpvpkM+miQx/9
	n7Daw6XeIdytNTuXbqA4U29IlfKGz5GOlwClTXvat+vbGykWRUpTobiQKiusKCvICFFEH5rhIl6Ea
	96uhiLbxOQNPfZnd14Rq2EPhI7VKe6h5o7jmcqUtnP6a/21lXkfk5i98IkvKuGXGsecLlY3hp68S+
	QBdniBerVgYfJRKFs8FReB1i7w5F1F5xwpAgZBm7F7LUHo/dpSCj6te4JpZCTI49Kf82+ZRQQtuTm
	vHDAcdHG1DyCujnBEbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp43A-000000081xl-0ZlS;
	Wed, 29 Jul 2026 13:10:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp437-000000081wu-0fRK
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:10:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47de0093c42so751786f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 06:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330615; cv=none;
        d=google.com; s=arc-20260327;
        b=iSbo2weyuUaSHXzfXa4WhoO2NhIRuUZjuKZh1U3F4SCpcP9RK4lco4H4Jivg/Zxfw7
         bEEvQB7N9w5PokAf0WB9wJEiPterxbyYvFVpyrNol7/WtY1VCsYtyTzRNbJevcL0dm/Z
         1ykB+3OveE3HcsNQ5636V3tMPzkrsH9zRuckCiaU4IRRXb511+i6oWG54gH+uNeiMR9Y
         hf2q5RJBry9YVOGeDohxAC81i894Srt2UBxO2pVAIHMxESVj+28c7hwhxB7mzdVjmJbH
         FN9qrPcWjkmmnvULyGbNkuzzBUS0pTMmAFzK6WriI4NYq2HGY0XltLipffZLLMj4cFPb
         hUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        fh=syUDb17NoYe3xxTpSTeZXQ+UU5Z4dIIPRH17TL8u2K0=;
        b=qwlLF0AS6803cu/sqFAzixqbcEyDcKIAnCqV3+V5y11Qsa/+T1Jk70VoJzRaW3iBL4
         IcINK/W2TbeariNMtVy4zhRV0M11K9N9UCo4ZZvBYJGMW+tF+4b4+Os8sN4Vhk15+1W0
         8mWaA9uWsxXOFXycKnSYn2fzsF1sArtH05jzQaHj+Ca0mKY+gobElvEDDXyhv7SXX5Ql
         B8ccUACnNJvzw7nk5ZMO2PwCDbSr3nWdgK1ipK9qXzKOt2QuyWZdqpHWnWAGJS+iLglI
         DMR3Z4aTX4fCbKDngLfYYHjFP+ZJaqJ/lqvr2oujbyTVJHDOYU2blrJlT3LAZkWc4joK
         BWgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330615; x=1785935415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        b=jSnPH4lBu1quPZS7CAIObu7nCBSA0XWQ1r6TkFEEoyrhDstum5DNON1VkK+iK59Z7Y
         PzLqDSwgSrO2kayXtvRMYWE9byQfWUnNkTDfmlGWM6J+yAXhfO2JQJ6yIU4+cve4cTEC
         nTLUQfnLkTXch+aL3HjhAeiKUf63gv5+VXy+FR58kE2LbYb9cIwISpmh0cxLiZro8M3v
         r7wx/RQFlVcFzr1GkegwJoJVoSCkS8DkisB7JqKU5RZA1xAPOcpaWUQVQSa7sbu3ZV+e
         muJ67d/CFmiLVTb5j3sIOwpMyDxByhacu779qIlrGxPsqHF5JCJQi6sK4OFTMeU1Aolq
         l7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330615; x=1785935415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        b=lfATyZxn9heVvhhk8Q4yf4h98vE2R2bsmF1JCVgumdGv+MxCurxtGOUpGYHhHEPVs9
         LmpGml5Z4Ugd8lx95DLrzUw03gdx81VhHt6yWjtG5mQ9Yvo60amfN9CMOAC1Sn8N7Lw+
         wq8MOeYo84Vcj5Lb40+WKJNa+eHjdTUhCi4PWbPubwv/9CELeD5EVsREhaZ8ynwXk8Jj
         PrfmomUGu5PZr/BnODvzi2k6OJQH7dugzN37sEcmxK6mE/KHNt4hEifg4WUoi+d3/8+m
         nLhuLqQ8CZZTlHPPg+C7WADbis/fypdX+tw+cBAS3bpNNPXJncOux2nSB/wfgC8cimMw
         eLYA==
X-Forwarded-Encrypted: i=1; AHgh+RraR44B8JZdzurzDwWqqB/9vf6CuITRKjzW/NV9a/CihfpI+PpSMglf3v8gRXEqKT+em8BDqXBxtJmLOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzam1Rhv8VqKnzrIM0/HqaxbsDIYUvydgzSFP4hO734mvYmDLyc
	HqcDuh0AQ4kqdqQ0JSlZWdx1P7Yp5CjFiN9JKZzzOzotye0qH3Po7JWfRbVexZxUd/Rb/hpct2M
	Ubs7DnpZqcVjxZnQ6Yt3TBzjiIZTQQgonknIddU9lEQ==
X-Gm-Gg: AR+sD12YuTgM7nnfEdIMkFMagma+/U5P/MLMcUEL3KyByUvxs0t1Buu9wPhEoz8XoDl
	lXFbaEgZwF1yiy1Je/yi863YHrtlBhMfT/pUii5hWbPOU9krrKUd5xnWAxdbsmGnKsvssO/6id7
	UGWVU9+JvIFldtDn59GcCxxP8XVjhZ8GWJhr6Gaa8zANs2N/naw25hzQZZ7h2XVJsPMrJy+2CZT
	HkvkeIzHSlhvf2KY8gxDysltUATFjz6T1Rxwyzeawzqcq/JtPsGWSlqwir0h/61kuuJAVzNF/NZ
	CD2dGSQrsPcvo0zYVT0DMgewXDoKhrLpYHVa84lA3+bGWqV2BPebL7WVl9AmqYv6toW+7Vfj7FK
	Zxr/hZGt6wBVu5+WURA4d9MY6fEPdz1VO1e994WlbaX/z1yjnrqXC7h+Hf/tBNu0=
X-Received: by 2002:a05:6000:707:b0:47f:90df:4ec6 with SMTP id
 ffacd0b85a97d-47fb1e5ffa9mr7439787f8f.6.1785330615148; Wed, 29 Jul 2026
 06:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-8-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-8-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:40:03 +0530
X-Gm-Features: AUfX_mzDcWuxE6PkzrbfuK4rtESRLEYMRMklaBIZb-MTh6f9nimxeIEC2cIHilw
Message-ID: <CAAhSdy2P3Fgfv3t9n=wNTfBL-63k+3qaDvsG1QWxtkWTFfvWvg@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] RISC-V: KVM: Add support for control-flow
 integrity FWFT features
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_061017_249666_8DB71928 
X-CRM114-Status: GOOD (  23.66  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozNOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ29udHJvbC1mbG93IGludGVncml0eSBpcyBjb250cm9s
bGVkIHRocm91Z2ggYSBXQVJMIGZpZWxkIGluIGhlbnZjZmcuCj4gRXhwb3NlIHRoZSBmZWF0dXJl
IG9ubHkgaWYgdGhlIFppY2ZpbHAvWmljZmlzcyBpcyBzdXBwb3J0ZWQgZm9yIFZTLW1vZGUuCj4g
QWxsb3cgdGhlIFZNTSB0byBibG9jayBhY2Nlc3MgdG8gdGhlIGZlYXR1cmUgYnkgZGlzYWJsaW5n
IHRoZSBJU0EKPiBleHRlbnNpb24gaW4gdGhlIGd1ZXN0Lgo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5T
aGVuZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1
YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nh
cy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggfCAgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgfCAxMDcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTA5IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBpbmRleCBmZDRjODE2OTc2
MTcuLjIwZDk5NTljYTQ0ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAt
MjQ4LDYgKzI0OCw4IEBAIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnQgewo+ICAgICAgICAgc3Ry
dWN0IGt2bV9yaXNjdl9zYmlfZndmdF9mZWF0dXJlIG1pc2FsaWduZWRfZGVsZWc7Cj4gICAgICAg
ICBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0X2ZlYXR1cmUgcG9pbnRlcl9tYXNraW5nOwo+ICAg
ICAgICAgc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdF9mZWF0dXJlIHB0ZV9hZF9od191cGRhdGlu
ZzsKPiArICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnRfZmVhdHVyZSBsYW5kaW5nX3Bh
ZDsKPiArICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnRfZmVhdHVyZSBzaGFkb3dfc3Rh
Y2s7Cj4gIH07Cj4KPiAgLyogSWYgeW91IG5lZWQgdG8gaW50ZXJwcmV0IHRoZSBpbmRleCB2YWx1
ZXMsIGhlcmUgaXMgdGhlIGtleTogKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggNGQ0
NzRhNDM5YjI5Li4wMzE1M2ZkOGQxNWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAg
LTE3Niw2ICsxNzYsOTUgQEAgc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVk
X2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgcmV0dXJuIFNCSV9T
VUNDRVNTOwo+ICB9Cj4KPiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9jZmkoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcgdmFsdWUsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0IGZsYWcpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPiArCj4gKyAgICAgICBp
ZiAodmFsdWUgPT0gMCkKPiArICAgICAgICAgICAgICAgY2ZnLT5oZW52Y2ZnICY9IH5mbGFnOwo+
ICsgICAgICAgZWxzZSBpZiAodmFsdWUgPT0gMSkKPiArICAgICAgICAgICAgICAgY2ZnLT5oZW52
Y2ZnIHw9IGZsYWc7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklf
RVJSX0lOVkFMSURfUEFSQU07Cj4gKwo+ICsgICAgICAgaWYgKGNmZy0+aGVudmNmZyAmIChFTlZD
RkdfTFBFIHwgRU5WQ0ZHX1NTRSkpCj4gKyAgICAgICAgICAgICAgIGNmZy0+aGVkZWxlZyB8PSBC
SVQoRVhDX1NPRlRXQVJFX0NIRUNLKTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAg
Y2ZnLT5oZWRlbGVnICY9IH5CSVQoRVhDX1NPRlRXQVJFX0NIRUNLKTsKPiArCj4gKyAgICAgICBp
ZiAoIW9uZV9yZWdfYWNjZXNzKSB7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVE
RUxFRywgY2ZnLT5oZWRlbGVnKTsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAg
ICAgICogQm90aCBCaXQgTFBFIGFuZCBTU0UgYXJlIGluIHRoZSBsb3dlciBwYXJ0LCBzbyBpdCBp
cyBzYWZlCj4gKyAgICAgICAgICAgICAgICAqIHRvIG9ubHkgd3JpdGUgdGhlIGhlbnZjZmcKPiAr
ICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNG
RywgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0
dXJuIFNCSV9TVUNDRVNTOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRfbGFu
ZGluZ19wYWRfc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAg
cmV0dXJuIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBaSUNG
SUxQKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQga3ZtX3NiaV9md2Z0X3Jlc2V0X2xhbmRpbmdf
cGFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV92Y3B1
X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+ICsKPiArICAgICAgIGt2bV9zYmlfZndm
dF9lbnZfZmxhZ19yZXNldF9oZWxwZXIodmNwdSwgRU5WQ0ZHX0xQRSk7Cj4gKyAgICAgICBpZiAo
KGNmZy0+aGVudmNmZyAmIChFTlZDRkdfTFBFIHwgRU5WQ0ZHX1NTRSkpID09IDApCj4gKyAgICAg
ICAgICAgICAgIGNmZy0+aGVkZWxlZyAmPSB+QklUKEVYQ19TT0ZUV0FSRV9DSEVDSyk7Cj4gK30K
PiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbGFuZGluZ19wYWQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLCB1bnNpZ25lZCBsb25nIHZh
bHVlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X3NldF9jZmkodmNwdSwgY29u
Ziwgb25lX3JlZ19hY2Nlc3MsIHZhbHVlLCBFTlZDRkdfTFBFKTsKPiArfQo+ICsKPiArc3RhdGlj
IGxvbmcga3ZtX3NiaV9md2Z0X2dldF9sYW5kaW5nX3BhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3Ni
aV9md2Z0X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX2dldF9oZWxwZXIodmNwdSwgY29u
Ziwgb25lX3JlZ19hY2Nlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsdWUsIEVOVkNGR19MUEUpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBr
dm1fc2JpX2Z3ZnRfc2hhZG93X3N0YWNrX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gK3sKPiArICAgICAgIHJldHVybiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSh2Y3B1
LT5hcmNoLmlzYSwgWklDRklTUyk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGt2bV9zYmlfZndm
dF9yZXNldF9zaGFkb3dfc3RhY2soc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKyAgICAg
ICBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+YXJjaC5jZmc7Cj4gKwo+ICsg
ICAgICAga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcih2Y3B1LCBFTlZDRkdfU1NF
KTsKPiArICAgICAgIGlmICgoY2ZnLT5oZW52Y2ZnICYgKEVOVkNGR19MUEUgfCBFTlZDRkdfU1NF
KSkgPT0gMCkKPiArICAgICAgICAgICAgICAgY2ZnLT5oZWRlbGVnICY9IH5CSVQoRVhDX1NPRlRX
QVJFX0NIRUNLKTsKPiArfQo+ICsKPiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9zaGFk
b3dfc3RhY2soc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgb25lX3JlZ19hY2Nl
c3MsIHVuc2lnbmVkIGxvbmcgdmFsdWUpCj4gK3sKPiArICAgICAgIHJldHVybiBrdm1fc2JpX2Z3
ZnRfc2V0X2NmaSh2Y3B1LCBjb25mLCBvbmVfcmVnX2FjY2VzcywgdmFsdWUsIEVOVkNGR19TU0Up
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZ2V0X3NoYWRvd19zdGFjayhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBvbmVfcmVnX2FjY2VzcywgdW5zaWdu
ZWQgbG9uZyAqdmFsdWUpCj4gK3sKPiArICAgICAgIHJldHVybiBrdm1fc2JpX2Z3ZnRfZW52X2Zs
YWdfZ2V0X2hlbHBlcih2Y3B1LCBjb25mLCBvbmVfcmVnX2FjY2VzcywKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZSwgRU5WQ0ZHX1NTRSk7Cj4g
K30KPiArCj4gIHN0YXRpYyBib29sIGt2bV9zYmlfZndmdF9wdGVfYWRfaHdfdXBkYXRpbmdfc3Vw
cG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICAgICAgICAgcmV0dXJuIHJpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTVkFEVSkgJiYKPiBAQCAt
MzEzLDYgKzQwMiwyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJl
IGZlYXR1cmVzW10gPSB7Cj4gICAgICAgICAgICAgICAgIC5zZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0
X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPiAgICAgICAgICAgICAgICAgLmdldCA9IGt2bV9zYmlf
ZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICAgICAgICAgfSwKPiArICAgICAgIHsK
PiArICAgICAgICAgICAgICAgLmlkID0gU0JJX0ZXRlRfTEFORElOR19QQUQsCj4gKyAgICAgICAg
ICAgICAgIC5maXJzdF9yZWdfbnVtID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlfZndm
dCwgbGFuZGluZ19wYWQuZW5hYmxlKSAvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+ICsgICAgICAgICAgICAgICAuc3VwcG9ydGVkID0g
a3ZtX3NiaV9md2Z0X2xhbmRpbmdfcGFkX3N1cHBvcnRlZCwKPiArICAgICAgICAgICAgICAgLnJl
c2V0ID0ga3ZtX3NiaV9md2Z0X3Jlc2V0X2xhbmRpbmdfcGFkLAo+ICsgICAgICAgICAgICAgICAu
c2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9sYW5kaW5nX3BhZCwKPiArICAgICAgICAgICAgICAgLmdl
dCA9IGt2bV9zYmlfZndmdF9nZXRfbGFuZGluZ19wYWQsCj4gKyAgICAgICB9LAo+ICsgICAgICAg
ewo+ICsgICAgICAgICAgICAgICAuaWQgPSBTQklfRldGVF9TSEFET1dfU1RBQ0ssCj4gKyAgICAg
ICAgICAgICAgIC5maXJzdF9yZWdfbnVtID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlf
ZndmdCwgc2hhZG93X3N0YWNrLmVuYWJsZSkgLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemVvZih1bnNpZ25lZCBsb25nKSwKPiArICAgICAgICAgICAgICAgLnN1cHBvcnRl
ZCA9IGt2bV9zYmlfZndmdF9zaGFkb3dfc3RhY2tfc3VwcG9ydGVkLAo+ICsgICAgICAgICAgICAg
ICAucmVzZXQgPSBrdm1fc2JpX2Z3ZnRfcmVzZXRfc2hhZG93X3N0YWNrLAo+ICsgICAgICAgICAg
ICAgICAuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9zaGFkb3dfc3RhY2ssCj4gKyAgICAgICAgICAg
ICAgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X3NoYWRvd19zdGFjaywKPiArICAgICAgIH0sCj4g
ICAgICAgICB7Cj4gICAgICAgICAgICAgICAgIC5pZCA9IFNCSV9GV0ZUX1BURV9BRF9IV19VUERB
VElORywKPiAgICAgICAgICAgICAgICAgLmZpcnN0X3JlZ19udW0gPSBvZmZzZXRvZihzdHJ1Y3Qg
a3ZtX3Jpc2N2X3NiaV9md2Z0LCBwdGVfYWRfaHdfdXBkYXRpbmcuZW5hYmxlKSAvCj4gLS0KPiAy
LjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
