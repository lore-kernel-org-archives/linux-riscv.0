Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA7FC369D5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8yP67qUYb2/tUTc8klNZkRh97MMRj0cmz13HNTLVCY=; b=qAt7tpPlejEgW+
	SOF/bvmcpCR+B4C+Lxa6gp+6GE1FmktOjFB86YpeOS/+ru53whO3/Sn0FHj/lDJSTX85u7nAv0MeX
	Qs35ArSOF8ku3iUF7VN3rfk8QPtKbv+IaVgbfCJS7j4GWEshB1/0nP+xK/noB/CCoCanDbRDAL7Fu
	B5yB9wk8JOmncGNYVD3wnEfBDyZKQKtdUdjr0O3/ulGw1Cb9WQGjfZroU3MK1ao9zjlL372nMSefh
	1+ox0C4AJ9n8zrbx7eMHU1Mp93TUQWsAea3auBvq7fSNhhdXr2kZONqWwGtMhcrCfn+3nCbtX703k
	aNJS0EysANEWoxG7jCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IsH-0000000HEeV-25gA;
	Fri, 25 Apr 2025 13:13:49 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hvb-0000000H4yu-0hG4
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:13:12 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-85db3475637so98839039f.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745583190; x=1746187990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LVCfKKGZ+VAx31B/QvtWLC+cXlvT+nFAC3b1QAmkzg=;
        b=ftWJvOAqkZpPSt1p0dBsZEyZ5F2hBnqXJwBVOs41dmivxy9w3Ec6BgUi2Wfozt8tOr
         cJGxayEW4xCrFqJd2siy2hfH4AAJpK3kS/BwisGILFBEQ+cXBaRl+qV1lpCdfzO4tX30
         NoLekgTyYeeXALOJcDIttr9rtTg4yM7GRI84t6GbZ/uDY9QSNvQn4kUdNja9XYJNfI7P
         uV31RIHKMUMoDrMTvJpkAk6mIkVqiLpltOlfGOatwqWa2qjA504mmkzcbOz3QyQVStG+
         v8N7ZlJOb4CjfqBgCFA5zJY85vwQPnYWf4b7MCTd8XveBnksLK5Dig6jwQV/RdIyadav
         VxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583190; x=1746187990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LVCfKKGZ+VAx31B/QvtWLC+cXlvT+nFAC3b1QAmkzg=;
        b=iuSGArFPAf8nqkvf19X7uivJV/zKjBgzD2yUqeIvhQAlpb718+rlE/bF/GLbHUmdTb
         jT34TTeEr1QL6HHtLT0TYtW911rEECnCGY9nN+HfdqUsJTCvkOOUkeXupC5NcrzlLQwh
         EhCfO/dqaTrq/xQLz/n70LKPl5k3FX3fK198VoPJxr9BszpGpK+PEM1z/W3w68duUANy
         oJ6mP2ri+Bga049zxkxNR+pjinkMwJrt5TtTZIf+X2Y+PZlQalYTv79CpGf3c2nllKWc
         mmWohTxFB37A8rvs44OSwUU34MQdD6/mtAZAdkkSXg8Zl1d5a3PdJbSCtgSKH2dEczOW
         qLVg==
X-Forwarded-Encrypted: i=1; AJvYcCXSs3AWc+dKWXSiXdpSvinY/KeBKPub+XtPqSPa8qWwvbZw7jEwG3cdHasulFumx7rtqA4wpefJNXisdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmK7blNCDxptV+sh9JMgE1YcJWLY+0cWkIAjCR8UWXV4x7fbtw
	PTR41I+hIl5iuculq7XjQuoevyFXgmgZMEk4OvuFO2rHF2TMoM+XbeAlDlq01E5L1WM608NXXAy
	oDdTbXKwZJKw0BQrxjBznYvwtHJzHh87UpgDRdQ==
X-Gm-Gg: ASbGncuPGbBpnDjLhCTHzq+6plD65wAfRSpKtY/A05KXX+PMPdIBYYz39ENSiJdbU/Y
	t+n++G/I/Me6Mv/M6eaVsxrC17F4/4zLh1Bgkdtl5iZjCfuLaG+tEGEJO3iBhDIkj3GBd7Ia0a2
	Z6/JnNfU7hN4RirxVel3hFIuM=
X-Google-Smtp-Source: AGHT+IEc4wQDIyAonXTkWsqY11L7QFIJfNSBIAH3ZY0qz8y4ByrVUK33TWmLeL/12iYhQYPbulWRTGy5kuvd1J/u8sE=
X-Received: by 2002:a05:6e02:2487:b0:3d9:2bfc:5767 with SMTP id
 e9e14a558f8ab-3d93b6cae6amr18674675ab.0.1745583189986; Fri, 25 Apr 2025
 05:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com> <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Apr 2025 17:42:58 +0530
X-Gm-Features: ATxdqUF3lkgMIhQKkdyVfB74UNuy_-e8DUJtUETJoF6k8Xhu-0BFfCT8lsZQsJA
Message-ID: <CAAhSdy0=c_dq7EpztQ9t83qbXBqD6E92xUadYvyv_kFj-Epw6Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify exact
 exception type
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051311_206989_56C6A55C 
X-CRM114-Status: GOOD (  17.23  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgNjoxMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgdGhlIHNiaV9wbXVfdGVzdCBjb250aW51
ZXMgaWYgdGhlIGV4Y2VwdGlvbiB0eXBlIGlzIGlsbGVnYWwKPiBpbnN0cnVjdGlvbiBiZWNhdXNl
IGFjY2VzcyB0byBocG1jb3VudGVyIHdpbGwgZ2VuZXJhdGUgdGhhdC4gSG93ZXZlciwgd2UKPiBt
YXkgZ2V0IGlsbGVnYWwgZm9yIG90aGVyIHJlYXNvbnMgYXMgd2VsbCB3aGljaCBzaG91bGQgcmVz
dWx0IGluIHRlc3QKPiBhc3NlcnRpb24uCgoiLi4uIEhvd2V2ZXIsIGlsbGVnYWwgaW5zdHJ1Y3Rp
b24gZXhjZXB0aW9ucyBtYXkgb2NjdXIgZHVlIHRvIG90aGVyCnJlYXNvbnMgd2hpY2ggc2hvdWxk
IHJlc3VsdCBpbiB0ZXN0IGFzc2VydGlvbi4iCgo+Cj4gVXNlIHRoZSBzdHZhbCB0byBkZWNvZGUg
dGhlIGV4YWN0IHR5cGUgb2YgaW5zdHJ1Y3Rpb25zIGFuZCB3aGljaCBjc3JzIGFyZQo+IGJlaW5n
IGFjY2Vzc2VkIGlmIGl0IGlzIGNzciBhY2Nlc3MgaW5zdHJ1Y3Rpb25zLiBBc3NlcnQgaW4gYWxs
IGNhc2VzCj4gZXhjZXB0IGlmIGl0IGlzIGEgY3NyIGFjY2VzcyBpbnN0cnVjdGlvbnMgdGhhdCBh
Y2Nlc3MgdmFsaWQgUE1VIHJlbGF0ZWQKPiByZWdpc3RlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCk90aGVyd2lzZSwgTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoK
PiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5j
IHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jp
c2N2L3NiaV9wbXVfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3Ni
aV9wbXVfdGVzdC5jCj4gaW5kZXggMDM0MDZkZTQ5ODlkLi4xMWJkZTY5YjUyMzggMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5jCj4g
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9wbXVfdGVzdC5jCj4g
QEAgLTEyOCwxMSArMTI4LDQzIEBAIHN0YXRpYyB2b2lkIHN0b3BfY291bnRlcih1bnNpZ25lZCBs
b25nIGNvdW50ZXIsIHVuc2lnbmVkIGxvbmcgc3RvcF9mbGFncykKPiAgICAgICAgICAgICAgICAg
ICAgICAgICJVbmFibGUgdG8gc3RvcCBjb3VudGVyICVsZCBlcnJvciAlbGRcbiIsIGNvdW50ZXIs
IHJldC5lcnJvcik7Cj4gIH0KPgo+ICsjZGVmaW5lIElOU05fT1BDT0RFX01BU0sgICAgICAgMHgw
MDdjCj4gKyNkZWZpbmUgSU5TTl9PUENPREVfU0hJRlQgICAgICAyCj4gKyNkZWZpbmUgSU5TTl9P
UENPREVfU1lTVEVNICAgICAyOAo+ICsKPiArI2RlZmluZSBJTlNOX01BU0tfRlVOQ1QzICAgICAg
IDB4NzAwMAo+ICsjZGVmaW5lIElOU05fU0hJRlRfRlVOQ1QzICAgICAgMTIKPiArCj4gKyNkZWZp
bmUgSU5TTl9DU1JfTUFTSyAgICAgICAgICAweGZmZjAwMDAwCj4gKyNkZWZpbmUgSU5TTl9DU1Jf
U0hJRlQgICAgICAgICAyMAo+ICsKPiArI2RlZmluZSBHRVRfUk0oaW5zbikgICAgICAgICAgICAo
KChpbnNuKSAmIElOU05fTUFTS19GVU5DVDMpID4+IElOU05fU0hJRlRfRlVOQ1QzKQo+ICsjZGVm
aW5lIEdFVF9DU1JfTlVNKGluc24pICAgICAgICgoKGluc24pICYgSU5TTl9DU1JfTUFTSykgPj4g
SU5TTl9DU1JfU0hJRlQpCj4gKwo+ICBzdGF0aWMgdm9pZCBndWVzdF9pbGxlZ2FsX2V4Y2VwdGlv
bl9oYW5kbGVyKHN0cnVjdCBleF9yZWdzICpyZWdzKQo+ICB7Cj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGluc247Cj4gKyAgICAgICBpbnQgb3Bjb2RlLCBjc3JfbnVtLCBmdW5jdDM7Cj4gKwo+ICAg
ICAgICAgX19HVUVTVF9BU1NFUlQocmVncy0+Y2F1c2UgPT0gRVhDX0lOU1RfSUxMRUdBTCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIGV4Y2VwdGlvbiBoYW5kbGVyICVseFxu
IiwgcmVncy0+Y2F1c2UpOwo+Cj4gKyAgICAgICBpbnNuID0gcmVncy0+c3R2YWw7Cj4gKyAgICAg
ICBvcGNvZGUgPSAoaW5zbiAmIElOU05fT1BDT0RFX01BU0spID4+IElOU05fT1BDT0RFX1NISUZU
Owo+ICsgICAgICAgX19HVUVTVF9BU1NFUlQob3Bjb2RlID09IElOU05fT1BDT0RFX1NZU1RFTSwK
PiArICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIGluc3RydWN0aW9uIHdpdGggb3Bj
b2RlIDB4JXggaW5zbiAweCVseFxuIiwgb3Bjb2RlLCBpbnNuKTsKPiArCj4gKyAgICAgICBjc3Jf
bnVtID0gR0VUX0NTUl9OVU0oaW5zbik7Cj4gKyAgICAgICBmdW5jdDMgPSBHRVRfUk0oaW5zbik7
Cj4gKyAgICAgICAvKiBWYWxpZGF0ZSBpZiBpdCBpcyBhIENTUiByZWFkL3dyaXRlIG9wZXJhdGlv
biAqLwo+ICsgICAgICAgX19HVUVTVF9BU1NFUlQoZnVuY3QzIDw9IDcgJiYgKGZ1bmN0MyAhPSAw
IHx8IGZ1bmN0MyAhPSA0KSwKPiArICAgICAgICAgICAgICAgICAgICAgICJVbmV4cGVjdGVkIHN5
c3RlbSBvcGNvZGUgd2l0aCBmdW5jdDMgMHgleCBjc3JfbnVtIDB4JXhcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICBmdW5jdDMsIGNzcl9udW0pOwo+ICsKPiArICAgICAgIC8qIFZhbGlkYXRl
IGlmIGl0IGlzIGEgSFBNQ09VTlRFUiBDU1Igb3BlcmF0aW9uICovCj4gKyAgICAgICBfX0dVRVNU
X0FTU0VSVChjc3JfbnVtID09IENTUl9DWUNMRSB8fCBjc3JfbnVtIDw9IENTUl9IUE1DT1VOVEVS
MzEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAiVW5leHBlY3RlZCBjc3JfbnVtIDB4JXhcbiIs
IGNzcl9udW0pOwo+ICsKPiAgICAgICAgIGlsbGVnYWxfaGFuZGxlcl9pbnZva2VkID0gdHJ1ZTsK
PiAgICAgICAgIC8qIHNraXAgdGhlIHRyYXBwaW5nIGluc3RydWN0aW9uICovCj4gICAgICAgICBy
ZWdzLT5lcGMgKz0gNDsKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
