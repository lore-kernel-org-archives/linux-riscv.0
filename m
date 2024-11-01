Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3892DE6F085
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GN+MrQs95mE6VDD3X1sgST+JaIPUUAv8qM3SBsRFP8U=; b=q+lnUmVOJPhUYy
	aDc3LDXWmsHL8QLuKfE+l8VtPcfIU8d/Igeolg6QKqZPSC4mTFCg5RkvNOx2VPWuBdvlaImGzB3Gf
	jdNOEhNZAWKr0oiKrNfiCffYDAYQ3qQodAbF1eGNmo2Rc336L6Ew3VgJRWC5rK1Zkjn7RVuzz78Xd
	qGKkBLIAa+W7svSkIWCJOBIxVP5DjMOmPPJFrj0HKCPj1nyGEP3lSv49xqn5ImOzcNcpOo2hwYT1m
	vCGO6svpASffNYfEdftsHuFSeNNUOsNx/6oJPtJDVVsd8v2+D+TrVMitaXapAtl5kf6mMBP2TijgP
	vazbodgDKyY0G/KYTJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xUY-000000089ub-1uoP;
	Fri, 01 Nov 2024 19:39:30 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xUU-000000089tg-3FUS;
	Fri, 01 Nov 2024 19:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730489966; x=1762025966;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=54QzldtV+oOQ8waAwjCrWq0G6D0V6v+b9usu7SWxFqg=;
  b=keffBhDtelqHi3ZMfxgNwcEQs1jysUB/SnZovvCXyWrIOrMA6tRZSZ7I
   j1iH2Rb2CDCysm+WK5xMnZKe7loGVDm+oaoBUriScgbiYEb3hmDWbGzud
   OHTNGLFohHD8wJ22JyGSpF6yNp+nZD69eU6nFrSkFNq9o/z73brXSKhCF
   lepx1xYL7bOdUfLqHiWZbrHfATLDxUxghMoVUlQeJ0t7h28jKScuFWQNd
   nIk4e25OCNjqIUlPZQIfKgWmcvzTFbmZWJzAjhJqGzeBoppxRBTMIwcFF
   rrpYv//m8x/sISCJwDg3pj5w0dApk+BfysaX/ArfskZIWzr8koLr3I7OV
   A==;
X-CSE-ConnectionGUID: dxivy0a3RJWUIJWeOTRDFg==
X-CSE-MsgGUID: A2Alvns5ThWc6SEWVdBPgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47717871"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47717871"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 12:39:24 -0700
X-CSE-ConnectionGUID: OHnYS5S6TcuNT3OY7OKdwA==
X-CSE-MsgGUID: 2dJ9/DffSeuFoRFq5NBtZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="87583065"
Received: from ccbilbre-mobl3.amr.corp.intel.com (HELO [10.124.220.146]) ([10.124.220.146])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 12:39:22 -0700
Message-ID: <4a015283-28e2-4459-825a-1fd542b81110@intel.com>
Date: Fri, 1 Nov 2024 12:39:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
To: "Manwaring, Derek" <derekmn@amazon.com>
References: <d467e6bd-c673-415f-8bb0-91603f06498a@intel.com>
 <71e9b2c8-0cc4-4646-88f0-7780e108e610@amazon.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <71e9b2c8-0cc4-4646-88f0-7780e108e610@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_123926_877524_0A8C5A3B 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: jthoughton@google.com, canellac@amazon.at, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, linux-mm@kvack.org, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, elena.reshetova@intel.com, linux-s390@vger.kernel.org, mlipp@amazon.at, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, seanjc@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/1/24 12:29, Manwaring, Derek wrote:
> As far as performance, are you talking about just the fracturing or
> something beyond that? The data Mike brought to LSFMMBPF 2023 showed the
> perf impact from direct map fragmentation for memfd_secret isn't "that
> bad" [1].

Just the fracturing.

Mike's data are interesting, but I still think we're pretty far away
from saying that the kernel doesn't need large mappings.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
