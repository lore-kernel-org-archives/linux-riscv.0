Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5CFC61DC4
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 04:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NpCCeDX+drxWubWUEnwHiN525Dhlx13YMjzhvOAfJo8=; b=4efu5rtlRvUWd+
	+nbli1rlWwtCS6xDeuAYFWhHI7MfWrdhQKXhqcakXhIEqRp+AYT+om0b8UTmIV3xc9YWnkWI9ecsT
	+d0/DKajJxbcNzEwvlupITSpUZUacdugZU5ym4Ki7dbCPP5WrR0EkdObypvmo3V/SYSmelYj9ML5E
	4xRvLQV0XckzvP6CIRuvmaPghwEHO50K38Y5MZA7+VVZhICxdNlbZo2hZoBbrdeCXEWLuXqjlliZC
	TT0ruMjIv6SRrQfMBEjDSVzvvjDXWHZcNlxJUbUhEDUVLB9VNEQI8OjeyB3ImYo1/ms9EwklQrad2
	+9S/8K3ySAmQBiZPZ8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0AUA-00000006hto-0yQy;
	Sat, 29 Aug 2026 04:16:06 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0AU7-00000006htL-30HT
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 04:16:04 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so768009a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 21:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787976963; x=1788581763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGT2M8YvEcErxicEiursvGC0O2RqQhubNLnE6l/5Ua8=;
        b=C93fqbITZLyDg3NAzv4/q0hutA3ydIDr3BTd8VVwYpp5oLepNDgiNovgs3tB/pCCFa
         t8+TWM2WfVohy8Jtl8622jmVKQe0fygU1j0jOAeLlmcDJIowQC8qo+LcscoewfrT9k+u
         gEJ6ni6zLQOY571zg95c9hDXwmzCtiNTYipd4iJ10aF9xPON2JDOOYFFbf2Uwfm6T/O+
         +ax/1ctkMo+9fOF8TN1Sf/Og/LxeClIS7W2+LCS0RhNZEKx35UH6PGTRergmddkClSbP
         uc1nv4BY88ifgjjUJXPCYjjXv+fA8Q0H2JuSNNg1CI0LjBREajUP14LMlgvY+9QnpFFD
         vPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787976963; x=1788581763;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGT2M8YvEcErxicEiursvGC0O2RqQhubNLnE6l/5Ua8=;
        b=chQsPIFj1s+HXz2j5/riml+JowHUJHk5UjYuYCohdBq1Hp4Kb34wf809snXoBwBB+R
         GRdTQt/P6IGGW3bLKqGaZ7bVN3MUs6RKT3j6670va/+Hsw3h8c3HcTDr7uZv/Clv+JIy
         ZNYHHxhNlUYUbEa2PoJhmK/u0vh8/7aF0WagbedZ/VbgqrtF3kj1AZ+mEi/iwXbUo9cm
         HzEltnoyRHy5mkDhBvmXf1lz0/b0kUs16h0M9gze/gKaFvHzRdV1AvNLVSRmF/aYy5o2
         oHgEnaXSZfixOKSfiBt1W9WAqKahvxH+ihnlmSftwtOaX+nybfln5sR56zp0IZKKP4Sg
         7+DQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1+MnZ0VML+5QvMH6qP3y98KDRlMxMXvIBpEaT4tBRJKrPZz+AeZhuDeo/WZQPYZn40E5fRR5it2mvdw==@lists.infradead.org
X-Gm-Message-State: AFuF++mkJsNbZcoLB9XbWhv14ea3lwluASAuVbMGDa72O3HGoHKc9c50
	rOsl54egElge4vgNxzLFBnYXUOBujxRw8Wc8Hy34j1tcW6oiIMS5t0IF
X-Gm-Gg: AR+sD10a4c+U7H9bx6H0trrJJIByY91ptm1lzBWBqLW+rjcFQDF7paRSzmBXlmmgP6a
	OBnbGIXkOjUXr+yyPtcjTzmklT4Ak3XPAdnlmowWaGZ+VC81JjQaXBW+G75jyWn506zaNDGBWYR
	dbzph0sBQskiVplwLbX6O8LiEkT6nBxlhRnDHFNMYC7JHkwailfnFVzUyw8kj4s0VmgNyeUqQbO
	BEFc0DQBegUzTpHsOb8XI55hZj60IMMZ8BFceKVRgicEfZxNnMQgwmuqAD3AlkgGlnU7VO6GLea
	wb7WFNaXkcsK/+4SLZsDKo5fvrkdLhiFo3hQeHb+jJjhAVEra+jFLmn+18j9oxcaFQi5ctZpzDj
	YnMjx68i45lB1PksedFDrNrsC9f5hNzv+5uR+fgYqxwR2QzP1yCa6p7vbEBRe1uSDCkviA+SBbm
	WyUhFE/oBBZaNLlcIR8j2uSGHvS8JO0fzwpHail+on1hSHo/0CZocN5xW37PNWpJTls+IPIC5qA
	Q==
X-Received: by 2002:a05:6a00:7607:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-85772baffdfmr6218757b3a.26.1787976962683;
        Fri, 28 Aug 2026 21:16:02 -0700 (PDT)
Received: from HPPC-archlinux ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36aecb6sm1228673a12.18.2026.08.28.21.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 21:16:02 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yukai Wu <xiaoyewuz.Ruster@gmail.com>
Subject: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Date: Sat, 29 Aug 2026 12:15:10 +0800
Message-ID: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_211603_762526_384CAB42 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

VXBkYXRlIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0IHRyYW5zbGF0aW9u
LgoKVXBkYXRlIHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCA5NTQyNjBmZjVhNDYKKCJS
ZXZlcnQgIlJJU0MtVjogbW06IERvY3VtZW50IG1tYXAgY2hhbmdlcyIiKQoKU2lnbmVkLW9mZi1i
eTogWXVrYWkgV3UgPHhpYW95ZXd1ei5SdXN0ZXJAZ21haWwuY29tPgotLS0KIC4uLi96aF9DTi9h
cmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QgICAgICAgICAgICAgfCAxOCArKysrKysrKystLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi92bS1s
YXlvdXQucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi92
bS1sYXlvdXQucnN0CmluZGV4IDRiOWY0ZGNmNmMxOS4uMGQwZWM4ZWE1ZDA1IDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYXJjaC9yaXNjdi92bS1s
YXlvdXQucnN0CkBAIC0xNSw3ICsxNSw3IEBAIFJJU0MtViBMaW51eOS4iueahOiZmuaLn+WGheWt
mOW4g+WxgAogOuS9nOiAhTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgogOuaXpeac
nzogMTIgRmVicnVhcnkgMjAyMQogCi3ov5nku73mlofku7bmj4/ov7DkuoZSSVNDLVYgTGludXjl
hoXmoLjkvb/nlKjnmoTomZrmi5/lhoXlrZjluIPlsYDjgIIKK+i/meS7veaWh+S7tuaPj+i/sOS6
hiBSSVNDLVYgTGludXgg5YaF5qC45L2/55So55qE6Jma5ouf5YaF5a2Y5biD5bGA44CCCiAKIDMy
5L2NIFJJU0MtViBMaW51eCDlhoXmoLgKID09PT09PT09PT09PT09PT09PT09PT0KQEAgLTI4LDkg
KzI4LDkgQEAgVE9ETwogNjTkvY0gUklTQy1WIExpbnV4IOWGheaguAogPT09PT09PT09PT09PT09
PT09PT09PQogCi1SSVNDLVbnibnmnYPmnrbmnoTmlofmoaPmjIflh7rvvIw2NOS9jeWcsOWdgCAi
5b+F6aG75L2/56ysNjMtNDjkvY3lgLzpg73nrYnkuo7nrKw0N+S9je+8jOWQpuWImeWwhuWPkeeU
n+e8uumhteW8guW4uOOAgiLvvJrov5nlsIbomZoKLeaLn+WcsOWdgOepuumXtOWIhuaIkOS4pOWN
iu+8jOS4remXtOacieS4gOS4qumdnuW4uOWkp+eahOa0nu+8jOS4i+WNiumDqOWIhuaYr+eUqOaI
t+epuumXtOaJgOWcqOeahOWcsOaWue+8jOS4iuWNiumDqOWIhuaYr1JJU0MtViBMaW51eAot5YaF
5qC45omA5Zyo55qE5Zyw5pa544CCCitSSVNDLVYg54m55p2D5p625p6E5paH5qGj5oyH5Ye677yM
NjQg5L2N5Zyw5Z2A4oCc5b+F6aG75L2/56ysIDYzLTQ4IOS9jeWAvOmDveetieS6juesrCA0NyDk
vY3vvIzlkKbliJnlsIblj5HnlJ/nvLrpobXlvILluLjjgILigJ3vvJoKK+i/meWwhuiZmuaLn+Wc
sOWdgOepuumXtOWIhuaIkOS4pOWNiu+8jOS4remXtOacieS4gOS4qumdnuW4uOWkp+eahOa0nu+8
jOS4i+WNiumDqOWIhuaYr+eUqOaIt+epuumXtOaJgOWcqOeahOWcsOaWue+8jOS4iuWNiumDqOWI
huaYryBSSVNDLVYKK0xpbnV4IOWGheaguOaJgOWcqOeahOWcsOaWueOAggogCiBSSVNDLVYgTGlu
dXggS2VybmVsIFNWMzkKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpAQCAtNTIsMTEgKzUyLDEx
IEBAIFJJU0MtViBMaW51eCBLZXJuZWwgU1YzOQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IOWGheaguOepuumXtOeahOiZmuaL
n+WGheWtmO+8jOWcqOaJgOaciei/m+eoi+S5i+mXtOWFseS6qzoKICAgX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19ffF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiAgICAgICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfCAgICAgICAgIHwK
LSAgIGZmZmZmZmM2ZmVlMDAwMDAgfCAtMjI4ICAgIEdCIHwgZmZmZmZmYzZmZWZmZmZmZiB8ICAg
IDIgTUIgfCBmaXhtYXAKLSAgIGZmZmZmZmM2ZmYwMDAwMDAgfCAtMjI4ICAgIEdCIHwgZmZmZmZm
YzZmZmZmZmZmZiB8ICAgMTYgTUIgfCBQQ0kgaW8KLSAgIGZmZmZmZmM3MDAwMDAwMDAgfCAtMjI4
ICAgIEdCIHwgZmZmZmZmYzdmZmZmZmZmZiB8ICAgIDQgR0IgfCB2bWVtbWFwCi0gICBmZmZmZmZj
ODAwMDAwMDAwIHwgLTIyNCAgICBHQiB8IGZmZmZmZmQ3ZmZmZmZmZmYgfCAgIDY0IEdCIHwgdm1h
bGxvYy9pb3JlbWFwIHNwYWNlCi0gICBmZmZmZmZkODAwMDAwMDAwIHwgLTE2MCAgICBHQiB8IGZm
ZmZmZmY2ZmZmZmZmZmYgfCAgMTI0IEdCIHwg55u05o6l5pig5bCE5omA5pyJ54mp55CG5YaF5a2Y
CisgICBmZmZmZmZjNGZlYTAwMDAwIHwgLTIzNiAgICBHQiB8IGZmZmZmZmM0ZmVmZmZmZmYgfCAg
ICA2IE1CIHwgZml4bWFwCisgICBmZmZmZmZjNGZmMDAwMDAwIHwgLTIzNiAgICBHQiB8IGZmZmZm
ZmM0ZmZmZmZmZmYgfCAgIDE2IE1CIHwgUENJIGlvCisgICBmZmZmZmZjNTAwMDAwMDAwIHwgLTIz
NiAgICBHQiB8IGZmZmZmZmM1ZmZmZmZmZmYgfCAgICA0IEdCIHwgdm1lbW1hcAorICAgZmZmZmZm
YzYwMDAwMDAwMCB8IC0yMzIgICAgR0IgfCBmZmZmZmZkNWZmZmZmZmZmIHwgICA2NCBHQiB8IHZt
YWxsb2MvaW9yZW1hcCBzcGFjZQorICAgZmZmZmZmZDYwMDAwMDAwMCB8IC0xNjggICAgR0IgfCBm
ZmZmZmZmNWZmZmZmZmZmIHwgIDEyOCBHQiB8IOebtOaOpeaYoOWwhOaJgOacieeJqeeQhuWGheWt
mAogICAgZmZmZmZmZjcwMDAwMDAwMCB8ICAtMzYgICAgR0IgfCBmZmZmZmZmZWZmZmZmZmZmIHwg
ICAzMiBHQiB8IGthc2FuCiAgIF9fX19fX19fX19fX19fX19fX3xfX19fX19fX19fX198X19fX19f
X19fX19fX19fX19ffF9fX19fX19fX3xfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAotLSAKMi41NS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
